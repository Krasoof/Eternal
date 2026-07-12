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
    "Swiete Swiatlo", "Uzdrawiajacy Dotyk", "Swieta Strzala", "Oczyszczenie Ogniem", "Rozproszenie Mroku", "Swiatlo Innosa", "Wygnanie Demonow", "Teleportacja", "Tchnienie Zycia", "Teleport do Klasztoru", "Teleport do Farmy Onara", "Teleportacja", "Do Przejscia w Dolinie Kopaln", "Teleportacja", 
    "Do Zamku Baronow Rudy", "Teleportacja", "Do Karczmy Orlana", "Leczenie Ran", "Swiatlo", "Ognista Strzala", "Lodowa Strzala", "Leczenie", "Przyzwanie Szkieletu", "Kula Ognia", "Blyskawica", "Przyzwanie Wilka", "Piesc Wiatru", "Sen", 
    "Oczyszczajace Swiatlo", "Uderzenie Pioruna", "Wielka Kula Ognia", "Przyzwanie Szkieleta Wojownika", "Strach", "Lodowy Blok", "Kula Piorunowa", "Przyzwanie Kamiennego Golema", "Zniszczenie Nieumarlych", "Ognista Burza", "Ognista Nawalnica", "Fala Lodu", "Przyzwanie Demona", "Przyplyw Wigoru", 
    "Deszcz Ognia", "Fala Smierci Uriziela", "Czarna Mgla", "Armia Mroku", "Pomniejszenie", "Przemiana w Zombie", "Przemiana w Szerszenia", "Przemiana w Miesnego Robaka", "Przemiana w Golema", "Przemiana w Wilka", "Przemiana w Jaszczura", "Przemiana w Glorhka", "Przemiana w Warga", "Przemiana w Ognistego Jaszczura", 
    "Przemiana w Weszyciela", "Przemiana w Cieniostwora", "Przemiana w Smoczego Chwytacza", "Zapomnienie", "Spojrzenie Innosa", "Strzala Mroku", "Kula Smierci", "Wir Energii", "Teleport Orkow", "Szpon Beliara", "Teleport do Obozu Braci", "Oczyszczajacy Wiatr", "Niezlomna Wola", "Opiekun Straznik", 
    "Burza", "Tornado", "Piesc Wody", "Lodowa Wlocznia", "Runa Pyrokara", "Gejzer", "Mora Ulartu", "Sciezka Wojownika", "Glos Straznika", "Fala Gniewu", "Przyzwanie Ognistego Golema", "Roj", "Oplatujace Korzenie", "Wchloniecie Ducha", 
    "Przyzwanie Kamiennego Straznika", "Wlocznia Mroku", "Rozdarcie Duszy", "Krzyk Umarlych", "Przyzwanie Zombie", "Przyzwanie Lodowego Golema", "Wrota Straznikow", "Przyzwanie Demona Legionu", "Stroz Straznik", "Ognisty Calun", "Hipnoza", "Widmowa Strzala", "Straszliwy Smrod", "Przyzwanie Kraita", 
    "Przyzwanie Snieznej Watahy", "Magiczna Wytrych", "Przyzwanie Bagiennego Golema", "Gniew Stworcow", "Przyzwanie Straznika Lasu", "Gniew Innosa", "Wir Energii", "Tar Szat", "Runa Druida", "Ognisty Blysk", "Lodowy Blysk", "Opetanie", "Trzesienie Ziemi", "Ognista Klatka", 
    "Wyczerpanie", "Fala Uderzeniowa", "Ognista Eksplozja", "Wniebowstapienie", "Dlon Chaosu", "Trujace Ukaszenie", "Grzmiaca Sfera", "Fala Elektryczna", "Fala Ognia", "Czerwona Burza", "Lodowa Eksplozja", "Zamiec", "Wycie Otchlani", "Magiczna Sfera", 
    "Kamienna Eksplozja", "Wlocznia Zepsucia", "Ognisty Blysk", "ZAREZERWOWANE", "Strzala Mroku", "Magiczny Wir", "Krzyz Zywiolow", "Skok", "Przyzwanie Demona", "Zadza Mordu", "Slabe Przeklenstwo Mroku", "Zaslona Mroku", "Kontrola Umyslu", "Mroczny Sen", 
    "Zadza Krwi", "Zaawansowane Przeklenstwo Mroku", "Wzmocnione Przeklenstwo Mroku", "Kula Mroku", "Wlocznia Mroku", "Wielka Kula Mroku", "Fala Mroku", "Mroczna Agonia", "Przyzwanie Tesvalla", "Przyzwanie Slugi", "Runa Kradziezy Zycia", "Runa Ochrony", "Runa Zarazy", "Runa Leczenia Slugi", 
    "Runa Absorpcji", "Runa 'Mistrz'", "Runa 'Wzmocnienie Mroku'", "Runa Ochrony Zywiolow", "Runa Magicznej Eksplozji", "Przyzwanie Szkieleta Lucznika", "Przyzwanie Szkieleta Wlocznika", "Przyzwanie Dzina", "Przyzwanie Szkieleta Goblina", "Aura Mocnych Kosci", "Przyzwanie Szkieleta Slugi", "Przyzwanie Szkieleta Cieniostwora", "Magiczna Strzala", "Aura Mistrzostwa Kosci", 
    "Aura Chyzych Kosci", "Aura Lepkiego Mroku", "Aura Zakletej Broni", "Leczenie Przyzwanych Stworzen", "Krwawa Nic", "Strumien Mroku", "Strumien Krwi", "Macki Mroku", "Widzenie w Ciemnosci", "Kradziez Krwi", "Przyzwanie Slugusa", "Przyzwanie Esencji Krwi", "Strumien Ognia", "Sciana Ognia", 
    "Kaluza Ognia", "Ognista Bron", "Ognisty Zawal", "Susy", "Pirokineza", "Mrozne Spetanie", "Elektrokineza", "Uduszenie", "Umartwienie", "Stlumienie", "Magiczna Ognista Strzala",
	/*End of game defaults*/
	"Przyzwanie Golema Cienia", "Przyzwanie Koscianego Psa", "Magiczna Strzala", "Przyzwanie Szkieleta Maga", "Przyzwanie Swietego Ognika", "Przyzwanie Golema Powietrza",
	/*buffs*/
	"Blogoslawienstwo - Ochrona", "Blogoslawienstwo - Witalnosc", "Blogoslawienstwo - Atrybuty", "Blogoslawienstwo - Regeneracja", "Blogoslawienstwo - Obrazenia",
	"Blogoslawienstwo - Szybkosc", "Blogoslawienstwo - Unik", "Blogoslawienstwo - Tarcza Energii", "Masowe Leczenie",
	/*debuffs*/
	"Klatwa - Podatnosci", "Klatwa - Oslabienie", "Klatwa - Wysysanie Zycia", "Klatwa - Spowolnienie", "Klatwa - Zatkanie Zycia",
	"Klatwa - Zelazna Dziewica", "Klatwa - Wiecej Obrazen", "Klatwa - Oslabienie Obrazen",
	"Przyzwanie Ducha", "Przyzwanie Koscianego Golema", "Przyzwanie Cieniostwora", "Przyzwanie Ognistego Ducha", "Przyzwanie Trolla", "Przyzwanie Pelzacza", "Przyzwanie Chwytacza",
	/*Timed effects*/
	"Egida Ognia", "Egida Lodu", "Egida Pioruna", "Egida Mroku", "Egida Powietrza", "Egida Ziemi", "Egida Trucizny", "Przyzwanie Eterycznego Golema"
};

const string StExt_Str_DiffLevel[5] =
{
	" ??? ",
	"Normalny",
	"Koszmar",
	"Pieklo",
	"Wlasny"
};

const string StExt_Str_Prehistory[StExt_PreHistoryMode_Max] =
{
	" ??? ",
	"Nikt",
	"Straznik w Starym Obozie",
	"Najemnik w Nowym Obozie",
	"Straznik w Bagiennym Obozie",
	"Mag Ognia",
	"Mag Wody",
	"Guru",
	"Nekromanta",
	"Baron Rudy",
	"Gornik Rudy"
};

const string StExt_Str_Learned = "Wyuczono: ";
const string StExt_Str_Random = "Losowo";
const string StExt_Str_UnknownConfig = "Wykryto nieznany zestaw ustawien!";
const string StExt_Str_LoadedConfig = "Wczytano zestaw ustawien - ";
const string StExt_Str_UserConfigsNotFound = "Nie znaleziono wlasnego zestawu ustawien!";

//		*** Weapon skill strings ***
const string StExt_Str_Config_WeaponSkillKey = "Klawisz ladowania umiejetnosci broni (nastepny cios zada bonusowe obrazenia)";
const string StExt_Str_Config_WeaponSkill_CooldownSec = "Czas odnowienia umiejetnosci broni (sekundy)";
const string StExt_Str_Config_WeaponSkill_StaminaCostPerc = "Koszt umiejetnosci broni w % wytrzymalosci (bron fizyczna)";
const string StExt_Str_Config_WeaponSkill_ManaCostPerc = "Koszt umiejetnosci broni w % many (bron magiczna)";
const string StExt_Str_WeaponSkill_Charged = "Umiejetnosc naladowana! Zadaj cios, by ja uwolnic.";
const string StExt_Str_WeaponSkill_OnCooldown = "Umiejetnosc broni jeszcze sie odnawia.";
const string StExt_Str_WeaponSkill_NotEnoughStamina = "Za malo wytrzymalosci na umiejetnosc broni.";
const string StExt_Str_WeaponSkill_NotEnoughMana = "Za malo many na umiejetnosc broni.";
const string StExt_Str_WeaponSkill_NoElement = "Ta bron nie ma wbudowanego zywiolu - naloz piecziec albo zdobadz bron z zywiolem.";
const string StExt_Str_Seal_ElementMismatch = "Zywiol pieczeci musi zgadzac sie z zywiolem broni.";
const string StExt_Str_Seal_NotBetter = "Ta piecziec nie jest mocniejsza od obecnego zywiolu broni.";

//		*** Element profession strings ***
const string StExt_Str_Config_ElementProfession_MaxSlots = "Ile zywiolow gracz moze wybrac jako profesje (pelny exp)";
const string StExt_Str_Config_ElementProfession_UniversalPenaltyPerc = "Mnoznik expa dla profesji Uniwersalnej (% z normalnego)";
const string StExt_Str_Config_ElementProfession_ResetCost = "Koszt zresetowania profesji zywiolu (zloto)";

const string StExt_Str_ElementProfession_Learned = "Wybrano profesje zywiolu!";
const string StExt_Str_ElementProfession_LearnedUniversal = "Wybrano profesje Uniwersalna - wszystkie zywioly odblokowane, ale ze zmniejszonym expem.";
const string StExt_Str_ElementProfession_Reset = "Zresetowano profesje zywiolu.";
const string StExt_Str_ElementProfession_NotEnoughGold = "Za malo zlota, by zresetowac profesje.";
const string StExt_Str_ElementProfession_UniversalOffer = "Chce profesje Uniwersalna (wszystkie zywioly, mniejszy exp)";
const string StExt_Str_ElementProfession_ResetOffer = "Zresetuj moja profesje zywiolu (za zloto)";

const string StExt_Str_FireMaster_Name = "Mistrz Ognia";
const string StExt_Str_FireMaster_Hi = "Porozmawiaj o profesji Ognia";
const string StExt_Str_FireMaster_Turnin = "Oddaj: 3x Siarka - naucz mnie Ognia";
const string StExt_Topic_ElementFire = "Nauka: Profesja Ognia";
const string StExt_Str_ElementFire_LogEntry_Done = "Mistrz Ognia nauczyl mnie profesji Ognia w zamian za siarke.";

const string StExt_Str_DarkMaster_Name = "Mistrz Mroku";
const string StExt_Str_DarkMaster_Hi = "Porozmawiaj o profesji Mroku";
const string StExt_Str_DarkMaster_Turnin = "Oddaj: 3x Czarna Perla - naucz mnie Mroku";
const string StExt_Topic_ElementDark = "Nauka: Profesja Mroku";
const string StExt_Str_ElementDark_LogEntry_Done = "Mistrz Mroku nauczyl mnie profesji Mroku w zamian za czarne perly.";

//		*** Weapon seal strings ***
const string StExt_Str_Seal_Fire_Name = "Pieczec Ognia";
const string StExt_Str_Seal_Ice_Name = "Pieczec Lodu";
const string StExt_Str_Seal_Electric_Name = "Pieczec Blyskawic";
const string StExt_Str_Seal_Air_Name = "Pieczec Wichru";
const string StExt_Str_Seal_Earth_Name = "Pieczec Ziemi";
const string StExt_Str_Seal_Light_Name = "Pieczec Swiatla";
const string StExt_Str_Seal_Dark_Name = "Pieczec Mroku";
const string StExt_Str_Seal_Death_Name = "Pieczec Smierci";

const string StExt_Str_Seal_Fire_Lesser_Name = "Pomniejsza Pieczec Ognia";
const string StExt_Str_Seal_Ice_Lesser_Name = "Pomniejsza Pieczec Lodu";
const string StExt_Str_Seal_Electric_Lesser_Name = "Pomniejsza Pieczec Blyskawic";
const string StExt_Str_Seal_Air_Lesser_Name = "Pomniejsza Pieczec Wichru";
const string StExt_Str_Seal_Earth_Lesser_Name = "Pomniejsza Pieczec Ziemi";
const string StExt_Str_Seal_Light_Lesser_Name = "Pomniejsza Pieczec Swiatla";
const string StExt_Str_Seal_Dark_Lesser_Name = "Pomniejsza Pieczec Mroku";
const string StExt_Str_Seal_Death_Lesser_Name = "Pomniejsza Pieczec Smierci";

const string StExt_Str_Seal_Fire_Greater_Name = "Wielka Pieczec Ognia";
const string StExt_Str_Seal_Ice_Greater_Name = "Wielka Pieczec Lodu";
const string StExt_Str_Seal_Electric_Greater_Name = "Wielka Pieczec Blyskawic";
const string StExt_Str_Seal_Air_Greater_Name = "Wielka Pieczec Wichru";
const string StExt_Str_Seal_Earth_Greater_Name = "Wielka Pieczec Ziemi";
const string StExt_Str_Seal_Light_Greater_Name = "Wielka Pieczec Swiatla";
const string StExt_Str_Seal_Dark_Greater_Name = "Wielka Pieczec Mroku";
const string StExt_Str_Seal_Death_Greater_Name = "Wielka Pieczec Smierci";

const string StExt_Str_Seal_Desc = "Uzyj z zalozona bronia, by nalozyc piecziec. Bron co kilka ciosow rzuci zaklecie zywiolu (koszt many/wytrzymalosci).";
const string StExt_Str_Seal_Applied = "Bron zostala naznaczona pieczecia!";
const string StExt_Str_Seal_NoWeapon = "Najpierw zaloz bron, na ktora nalozysz piecziec.";
const string StExt_Str_Seal_AlreadySealed = "Ta bron ma juz piecziec.";
const string StExt_Str_Seal_CannotSeal = "Ta bron nie przyjmie pieczeci (wymaga broni magicznej/ulepszonej).";

//		*** Weapon enchanting (StonedTrader) ***
const string StExt_Str_Enchant_Offer = "Zaklnij moja bron (przekuje ja w magiczna)";
const string StExt_Str_Enchant_NoWeapon = "Najpierw zaloz bron, ktora mam zaklac.";
const string StExt_Str_Enchant_AlreadyMagic = "Ta bron juz jest magiczna - nie potrzebuje zaklinania.";
const string StExt_Str_Enchant_NotEnoughGold = "Za malo zlota na zaklecie broni.";
const string StExt_Str_Enchant_Done = "Bron przekuta w magiczna!";
const string StExt_Str_Enchant_WrongType = "Tego rodzaju broni nie potrafie zaklac.";
const string StExt_Str_Reroll_Offer = "Przemieszaj staty mojej magicznej broni (3000 zlota)";
const string StExt_Str_Reroll_NotMagic = "Ta bron nie jest magiczna - najpierw ja zaklnij.";
const string StExt_Str_Reroll_Sealed = "Nie przemieszam broni z nalozona pieczecia.";

const string StExt_Str_CorruptionName[StExt_Corruption_Max] =
{
	"Nieskazony",
	"Skazony Mag",
	"Skazony Wojownik",
	"Skazony Lucznik"
};

const string StExt_Str_CorruptionDesc[StExt_Corruption_Max] =
{
	"Skazenie duszy pozwala zyskac niezwykle cechy ciala i umyslu, lecz kosztem wielkiego poswiecenia...",
	"Skazony mag to juz nie zwykly czarodziej, lecz uosobienie samej magii. Odrzuciwszy cialo, zaglebil sie w badanie istoty magii i tego, co nieznane. Poswiecajac zdrowie i wlasna esencje, zyskal w zamian niewyobrazalny potencjal magiczny. Jego zaklecia sa przedluzeniem jego woli, a w zylach zamiast krwi plynie czysta energia. Tylko dobra, stara stal moze powstrzymac to wcielenie magii, z latwoscia niszczac jego cialo...",
	"Skazony wojownik ucielesnia sama idee 'zywej skaly'. Odrzuciwszy czesc duchowa i skierowawszy ja na rozwoj cielesnej powloki, stal sie niemal niezniszczalny. Cala duchowa esencja takiego wojownika ucielesnila sie w swiecie fizycznym pod postacia ogromnego zapasu sil zywotnych. W zamian jednak sciezka magii jest dla niego niemal zamknieta.",
	"Skazony lucznik to specjalista walki na dystans, ktory, podobnie jak skazony wojownik, zainwestowal cala swoja dusze w rozwoj ciala. Zamiast jednak zamieniac energie w ogromne zapasy sil zywotnych, obral inna droge - szybkosci i refleksu. Dzieki nadludzkiej zrecznosci potrafi uniknac wielu atakow, a nieludzka celnosc pozwala mu razic przeciwnikow z dystansu, zanim ci zdaza uswiadomic sobie zblizajaca sie zgube. Taka metamorfoza nie odbyla sie jednak bez kosztow - zapas sil duchowych i zywotnych ucierpial nieco na rzecz zwinnosci i szybkosci ataku."
};

//		*** Talents strings ***
const string StExt_Str_Talents_Header = "--- * Szkoly Magii i Sztuk Walki * ---";
const string StExt_Str_Talents_Progress = "Obecny poziom: ";
const string StExt_Str_Talents_Exp = "Doswiadczenie: ";
const string StExt_Str_Talents_Lp = "Punkty nauki: ";

const string StExt_Str_MasteryNames[StExt_MasteryIndex_Max] = 
{
	"Pirokinetyka", "Hydromancja", "Elektromancja", "Aeromancja",
	"Geomancja", "Jasna Magia", "Mroczna Magia", "Magia Smierci", "Magia Zycia",
	"Tworzenie Golemow", "Demonologia", "Nekromancja", "Magia Ducha",
	"Sztuka Wojny", "Sztuka Obrony", "Sztuka Lucznictwa"
};

const string StExt_Str_MasteryLevels[StExt_TalentLevel_Max] = 
{ "Niewyszkolony", "Uczen", "Adept", "Ekspert", "Mistrz", "Magister", "Wielki Mistrz" };

const string StExt_Str_MasteryDescription[StExt_MasteryIndex_Max] = 
{
	"Pirokinetyka - Sztuka Panowania nad Zywiolem Ognia",
	"Hydromancja - Sztuka Panowania nad Zywiolem Wody i Lodu",
	"Elektromancja - Sztuka Panowania nad Zywiolem Pioruna",
	"Aeromancja - Sztuka Panowania nad Zywiolem Powietrza",
	"Geomancja - Sztuka Panowania nad Zywiolem Ziemi",
	"Jasna Magia - Sztuka Jasnej Magii i Blogoslawienstw",
	"Mroczna Magia - Sztuka Mrocznej Magii i Klatw",
	"Magia Smierci - Sztuka Panowania nad Zywiolem Smierci",
	"Magia Zycia - Sztuka Leczenia, Przyzywania Bestii i Przemiany",
	"Tworzenie Golemow - Sztuka Tworzenia i Ulepszania Golemow",
	"Demonologia - Sztuka Przyzywania Demonow",
	"Nekromancja - Sztuka Tworzenia Nieumarlych Slug",
	"Magia Ducha - Sztuka Walki Magicznej i Ochrony",
	"Sztuka Wojny - Sztuka Wladania Bronia do Walki Wrecz",
	"Sztuka Obrony - Sztuka Walki w Zbroi i Bez Niej",
	"Sztuka Lucznictwa - Sztuka Wladania Bronia Dystansowa"
};


/* *** Status menu ui strings *** 	*/
const string StExt_StatsMenu_TabName[5] = { "Statystyki", "Atrybuty", "Umiejetnosci", "Profesje", "Bonusy" };
const string StExt_PcStats_SectionDesc[7] = { "Umiejetnosci", "Ochrona", "Atak", "Aury", "Przyzwanie", "Rozne",  "Atrybuty"};
const string StExt_PcStats_Desc[StExt_PcStats_Index_Max] = 
{
	"Zdrowie:",
	"Mana:",
	"Wytrzymalosc:",
	"Regeneracja zdrowia:",
	"Regeneracja many:",
	"Regeneracja wytrzymalosci:",
	"Sila:",
	"Zrecznosc:",
	"Inteligencja:",
	"Moc magiczna:",
	"Bieglosc w broni jednorecznej:",
	"Bieglosc w broni dwurecznej:",
	"Bieglosc w luku:",
	"Bieglosc w kuszy:",
	"Zdrowie (%):",
	"Mana (%):",
	"Wytrzymalosc (%):",
	"Sila (%):",
	"Zrecznosc (%):",
	"Inteligencja (%):",
	"Regeneracja zdrowia (%):",
	"Regeneracja many (%):",
	"Regeneracja wytrzymalosci (%):",
	"Tarcza energii:",
	"Tarcza energii (%):",
	"Regeneracja tarczy energii (na sek.):",
	"Regeneracja tarczy energii (% na sek.):",
	"Szansa na unik:",
	"Ochrona przed obrazeniami siecznymi:",
	"Ochrona przed obrazeniami obuchowymi:",
	"Ochrona przed ogniem:",
	"Ochrona przed magia:",
	"Ochrona przed odrzutem:",
	"Ochrona przed obrazeniami klutymi:",
	"Ochrona przed obrazeniami siecznymi (%):",
	"Ochrona przed obrazeniami obuchowymi (%):",
	"Ochrona przed ogniem (%):",
	"Ochrona przed magia (%):",
	"Ochrona przed odrzutem (%):",
	"Ochrona przed obrazeniami klutymi (%):",
	"Odpornosc na obrazenia sieczne (%):",
	"Odpornosc na obrazenia obuchowe (%):",
	"Odpornosc na obrazenia od ognia (%):",
	"Odpornosc na obrazenia magiczne (%):",
	"Odpornosc na obrazenia odrzutu (%):",
	"Odpornosc na obrazenia klute (%):",
	"Odpornosc na trucizne (%):",
	"Odpornosc na obrazenia obszarowe (%):",
	"Maksymalna szansa na unik (%):",
	"Maksymalna odpornosc na obrazenia sieczne (%):",
	"Maksymalna odpornosc na obrazenia obuchowe (%):",
	"Maksymalna odpornosc na obrazenia od ognia (%):",
	"Maksymalna odpornosc na obrazenia magiczne (%):",
	"Maksymalna odpornosc na obrazenia odrzutu (%):",
	"Maksymalna odpornosc na obrazenia klute (%):",
	"Maksymalna odpornosc na trucizne (%):",
	"Maksymalna odpornosc na obrazenia obszarowe (%):",
	"Szansa na zignorowanie obrazen (%):",
	"Szansa na odbicie czesci obrazen (%):",
	"Szansa na odbicie zaklecia (%):",
	"Szansa na pochloniecie zaklecia (%):",
	"Szansa na odbicie pocisku (%):",
	"Odpornosc na trucizne:",
	"Odpornosc na klatwy:",
	"Odpornosc na oslabienie:",
	"Przywracanie czesci sil zywotnych (%) z otrzymanych obrazen:",
	"Przywracanie czesci sil magicznych (%) z otrzymanych obrazen:",
	"Przywracanie czesci tarczy energii (%) z otrzymanych obrazen:",
	"Przywracanie czesci wytrzymalosci (%) z otrzymanych obrazen:",
	"Dodatkowe obrazenia:",
	"Dodatkowe obrazenia w walce wrecz:",
	"Dodatkowe obrazenia dystansowe:",
	"Dodatkowe obrazenia magiczne:",
	"Dodatkowe obrazenia (%):",
	"Dodatkowe obrazenia w walce wrecz (%):",
	"Dodatkowe obrazenia dystansowe (%):",
	"Dodatkowe obrazenia magiczne (%):",
	"Dodatkowe obrazenia od umiejetnosci bojowej:",
	"Dodatkowe obrazenia od umiejetnosci bojowej (%):",
	"Dodatkowe obrazenia obuchowe:",
	"Dodatkowe obrazenia sieczne:",
	"Dodatkowe obrazenia od ognia:",
	"Dodatkowe obrazenia odrzutu:",
	"Dodatkowe obrazenia magiczne:",
	"Dodatkowe obrazenia klute:",
	"Dodatkowe obrazenia trujace:",
	"Dodatkowe obrazenia sieczne (trwale):",
	"Dodatkowe obrazenia obuchowe (trwale):",
	"Dodatkowe obrazenia od ognia (trwale):",
	"Dodatkowe obrazenia odrzutu (trwale):",
	"Dodatkowe obrazenia magiczne (trwale):",
	"Dodatkowe obrazenia klute (trwale):",
	"Dodatkowe obrazenia trujace (trwale):",
	"Dodatkowy czas trwania obrazen:",
	"Dodatkowe obrazenia broni jednorecznej:",
	"Dodatkowe obrazenia broni dwurecznej:",
	"Dodatkowe obrazenia z luku:",
	"Dodatkowe obrazenia z kuszy:",
	"Dodatkowe obrazenia obu broni:",
	"Dodatkowe obrazenia broni jednorecznej (%):",
	"Dodatkowe obrazenia broni dwurecznej (%):",
	"Dodatkowe obrazenia z luku (%):",
	"Dodatkowe obrazenia z kuszy (%):",
	"Dodatkowe obrazenia obu broni (%):",
	"Dodatkowe obrazenia obuchowe (%):",
	"Dodatkowe obrazenia sieczne (%):",
	"Dodatkowe obrazenia od ognia (%):",
	"Dodatkowe obrazenia odrzutu (%):",
	"Dodatkowe obrazenia klute (%):",
	"Dodatkowe obrazenia trujace (%):",
	"Dodatkowe obrazenia magiczne (%):",
	"Dodatkowe obrazenia obszarowe:",
	"Dodatkowe obrazenia obszarowe (%):",
	"Dodatkowe obrazenia magiczne obszarowe:",
	"Dodatkowe obrazenia magiczne obszarowe (%):",
	"Dodatkowe obrazenia obszarowe od broni:",
	"Dodatkowe obrazenia obszarowe od broni (%):",
	"Dodatkowe obrazenia zadawane ludziom:",
	"Dodatkowe obrazenia zadawane orkom:",
	"Dodatkowe obrazenia zadawane istotom zla:",
	"Dodatkowe obrazenia zadawane nieumarlym:",
	"Dodatkowe obrazenia zadawane zwierzetom:",
	"Dodatkowe obrazenia zadawane golemom:",
	"Dodatkowe obrazenia zadawane ludziom (%):",
	"Dodatkowe obrazenia zadawane orkom (%):",
	"Dodatkowe obrazenia zadawane istotom zla (%):",
	"Dodatkowe obrazenia zadawane nieumarlym (%):",
	"Dodatkowe obrazenia zadawane zwierzetom (%):",
	"Dodatkowe obrazenia zadawane golemom (%):",
	"Szansa na obrazenia krytyczne zaklec (%):",
	"Mnoznik obrazen krytycznych zaklec (%):",
	"Redukcja kosztu zaklec (%):",
	"Szansa na podwojne obrazenia bronia (%):",
	"Szansa na powtorne rzucenie zaklecia (%):",
	"Szansa na ogluszenie (%):",
	"Szansa na zamrozenie (%):",
	"Przywracanie sil zywotnych za trafienie:",
	"Przywracanie sil magicznych za trafienie:",
	"Przywracanie wytrzymalosci za trafienie:",
	"Przywracanie tarczy energii za trafienie:",
	"Kradziez sil zywotnych za trafienie:",
	"Kradziez sil magicznych za trafienie:",
	"Kradziez tarczy energii za trafienie:",
	"Kradziez sil zywotnych za trafienie (%):",
	"Kradziez sil magicznych za trafienie (%):",
	"Kradziez tarczy energii za trafienie (%):",
	"Moc magii ognia:",
	"Moc magii lodu:",
	"Moc magii ziemi:",
	"Moc magii powietrza:",
	"Moc magii elektrycznosci:",
	"Moc mrocznej magii:",
	"Moc jasnej magii:",
	"Moc magii zycia:",
	"Moc magii smierci:",
	"Moc demonologii:",
	"Moc tworzenia golemow:",
	"Moc nekromancji:",
	"Liczba aur:",
	"Moc aury:",
	"Moc aury (%):",
	"Zasieg aury:",
	"Zasieg aury (%):",
	"Dodatkowa szansa aktywacji aury:",
	"Redukcja rezerwacji zasobu aury (%):",
	"Redukcja rezerwacji many aury (%):",
	"Redukcja rezerwacji wytrzymalosci aury (%):",
	"Redukcja rezerwacji zycia aury (%):",
	"Zarezerwowane zycie (%):",
	"Zarezerwowana mana (%):",
	"Zarezerwowana wytrzymalosc (%):",
	"Zarezerwowana tarcza energii (%):",
	"Szansa na zamiane zabitego przeciwnika w szkieleta (%):",
	"Dodatkowo przyzwane stworzenia:",
	"Moc przyzwanych stworzen (%):",
	"Dodatkowe atrybuty przyzwanych stworzen (%):",
	"Dodatkowa ochrona przyzwanych stworzen (%):",
	"Dodatkowe obrazenia przyzwanych stworzen (%):",
	"Dodatkowe sily zywotne przyzwanych stworzen (%):",
	"Regeneracja sil zywotnych przyzwanych stworzen:",
	"Regeneracja tarczy energii przyzwanych stworzen:",
	"Dodatkowe sily zywotne przyzwanych stworzen:",
	"Dodatkowa tarcza energii przyzwanych stworzen:",
	"Dodatkowa sila przyzwanych stworzen:",
	"Dodatkowa zrecznosc przyzwanych stworzen:",
	"Dodatkowa szansa na unik przyzwanych stworzen (%):",
	"Dodatkowa ochrona przyzwanych stworzen:",
	"Dodatkowa ochrona sieczna przyzwanych stworzen:",
	"Dodatkowa ochrona obuchowa przyzwanych stworzen:",
	"Dodatkowa ochrona przed ogniem przyzwanych stworzen:",
	"Dodatkowa ochrona przed magia przyzwanych stworzen:",
	"Dodatkowa ochrona przed odrzutem przyzwanych stworzen:",
	"Dodatkowa ochrona kluta przyzwanych stworzen:",
	"Dodatkowa odpornosc na obrazenia sieczne przyzwanych stworzen (%):",
	"Dodatkowa odpornosc na obrazenia obuchowe przyzwanych stworzen (%):",
	"Dodatkowa odpornosc na obrazenia od ognia przyzwanych stworzen (%):",
	"Dodatkowa odpornosc na obrazenia magiczne przyzwanych stworzen (%):",
	"Dodatkowa odpornosc na obrazenia odrzutu przyzwanych stworzen (%):",
	"Dodatkowa odpornosc na obrazenia klute przyzwanych stworzen (%):",
	"Dodatkowa odpornosc na trucizne przyzwanych stworzen (%):",
	"Dodatkowe obrazenia przyzwanych stworzen:",
	"Dodatkowe obrazenia obuchowe przyzwanych stworzen:",
	"Dodatkowe obrazenia sieczne przyzwanych stworzen:",
	"Dodatkowe obrazenia od ognia przyzwanych stworzen:",
	"Dodatkowe obrazenia odrzutu przyzwanych stworzen:",
	"Dodatkowe obrazenia klute przyzwanych stworzen:",
	"Dodatkowe obrazenia trujace przyzwanych stworzen:",
	"Dodatkowe obrazenia magiczne przyzwanych stworzen:",
	"Moc przyzwanych nieumarlych (%):",
	"Dodatkowe atrybuty przyzwanych nieumarlych (%):",
	"Dodatkowa ochrona przyzwanych nieumarlych (%):",
	"Dodatkowe obrazenia przyzwanych nieumarlych (%):",
	"Moc przyzwanych zwierzat (%):",
	"Dodatkowe atrybuty przyzwanych zwierzat (%):",
	"Dodatkowa ochrona przyzwanych zwierzat (%):",
	"Dodatkowe obrazenia przyzwanych zwierzat (%):",
	"Moc przyzwanych golemow (%):",
	"Dodatkowe atrybuty przyzwanych golemow (%):",
	"Dodatkowa ochrona przyzwanych golemow (%):",
	"Dodatkowe obrazenia przyzwanych golemow (%):",
	"Moc przyzwanych demonow (%):",
	"Dodatkowe atrybuty przyzwanych demonow (%):",
	"Dodatkowa ochrona przyzwanych demonow (%):",
	"Dodatkowe obrazenia przyzwanych demonow (%):",
	"Dodatkowe sily zywotne przyzwanych zwierzat (%):",
	"Dodatkowe sily zywotne przyzwanych nieumarlych (%):",
	"Dodatkowe sily zywotne przyzwanych golemow (%):",
	"Dodatkowe sily zywotne przyzwanych demonow (%):",
	"Moc przyzwanych totemow (%):",
	"Dodatkowe atrybuty przyzwanych totemow (%):",
	"Dodatkowa ochrona przyzwanych totemow (%):",
	"Dodatkowe obrazenia przyzwanych totemow (%):",
	"Dodatkowe sily zywotne przyzwanych totemow (%):",
	"Leczenie przyzwanych totemow (na sek.):",
	"Leczenie przyzwanych stworzen (na sek.):",
	"Leczenie przyzwanych golemow (na sek.):",
	"Leczenie przyzwanych nieumarlych (na sek.):",
	"Leczenie przyzwanych demonow (na sek.):",
	"Leczenie przyzwanych zwierzat (na sek.):",
	"Szczescie:",
	"Dodatkowe szczescie (skrzynie):",
	"Dodatkowe szczescie (przeciwnicy):",
	"Dodatkowe szczescie (zloto):",
	"Dodatkowa szansa kradziezy (%):",
	"Szansa na ukrycie sie po trafieniu:",
	"Dodatkowy czas trwania efektu (%):",
	"Dodatkowa szybkosc dzialania:",
	"Kradziez wytrzymalosci za obrazenia:",
	"Kradziez wytrzymalosci za obrazenia (%):",
	"Moc magii ducha:",
	"Ochrona przed upadkiem / trucizna:",
	"Ochrona przed upadkiem / trucizna (%):",
	"Redukcja rezerwacji tarczy energii aury (%):",
	"Odbite obrazenia obuchowe:",
    "Odbite obrazenia sieczne:",
    "Odbite obrazenia klute:",
    "Odbite obrazenia od ognia:",
    "Odbite obrazenia odrzutu:",
    "Odbite obrazenia magiczne:",
    "Odbite obrazenia trujace:",	
	"Odbite obrazenia obuchowe (%):",
    "Odbite obrazenia sieczne (%):",
    "Odbite obrazenia klute (%):",
    "Odbite obrazenia od ognia (%):",
    "Odbite obrazenia odrzutu (%):",
    "Odbite obrazenia magiczne (%):",
    "Odbite obrazenia trujace (%):",
	"Odbite obrazenia obuchowe (DoT):",
    "Odbite obrazenia sieczne (DoT):",
    "Odbite obrazenia klute (DoT):",
    "Odbite obrazenia od ognia (DoT):",
    "Odbite obrazenia odrzutu (DoT):",
    "Odbite obrazenia magiczne (DoT):",
    "Odbite obrazenia trujace (DoT):",	
	"Redukcja otrzymywanych obrazen:",
	"Redukcja otrzymywanych obrazen (%):",
	"Celnosc:",
	"Celnosc (%):",
	"Celnosc slug:",
	"Celnosc slug (%):",
	"Odpornosc na obrazenia w czasie (%):",
	"Moc blogoslawienstw:",
	"Moc klatw:",
	"Odpornosc na odbite obrazenia (%):",
	"Maksymalna odpornosc na obrazenia w czasie (%):",
	"Maksymalna odpornosc na odbite obrazenia (%):",
	"Dodatkowe obrazenia w czasie przyzwanych stworzen:",
	"Dodatkowe obrazenia obuchowe w czasie przyzwanych stworzen:",
	"Dodatkowe obrazenia sieczne w czasie przyzwanych stworzen:",
	"Dodatkowe obrazenia od ognia w czasie przyzwanych stworzen:",
	"Dodatkowe obrazenia odrzutu w czasie przyzwanych stworzen:",
	"Dodatkowe obrazenia magiczne w czasie przyzwanych stworzen:",
	"Dodatkowe obrazenia klute w czasie przyzwanych stworzen:",
	"Dodatkowe obrazenia trujace w czasie przyzwanych stworzen:",
	"Odpornosc przyzwanych na obrazenia obszarowe (%):",
	"Odpornosc przyzwanych na obrazenia w czasie (%):",
	"Odpornosc przyzwanych na odbite obrazenia (%):",
	"Zwracane obrazenia miazdzace przyzwanych stworzen:",
	"Zwracane obrazenia sieczne przyzwanych stworzen:",
	"Zwracane obrazenia klute przyzwanych stworzen:",
	"Zwracane obrazenia od ognia przyzwanych stworzen:",
	"Zwracane obrazenia odrzutu:",
	"Zwracane obrazenia magiczne przyzwanych stworzen:",
	"Zwracane obrazenia trujace przyzwanych stworzen:",
	"Zwracane obrazenia miazdzace przyzwanych stworzen (DoT):",
	"Zwracane obrazenia sieczne (DoT):",
	"Zwracane obrazenia klute przyzwanych stworzen (DoT):",
	"Zwracane obrazenia od ognia przyzwanych stworzen (DoT):",
	"Zwracane obrazenia odrzutu (DoT):",
	"Zwracane obrazenia magiczne przyzwanych stworzen (DoT):",
	"Zwracane obrazenia trujace (DoT) przyzwanych stworzen:"
};

// Infusion->Affix
const string StExt_MagicInfusionAffix_Name[StExt_MagicInfusionAffix_Max] = 
{
	"Bestia",
	"Lotr",
	"Pies",
	"Trup",
	"Karaluch",
	"Goliat",
	"Ichtiander",
	"Bekart",
	"Geniusz",
	"Ghul",
	"Slepiec",
	"Wloczega",
	"Demon",
	"Golem",
	"Gad",
	"Zwloki",
	"Wisielec",
	"Chochlik",
	"Lis",
	"Zebrak",
	"Przyzywacz",
	"Skorpion",
	"Foka",
	"Topielec",
	"Duch",
	"Wiatr",
	"Potwor",
	"Ropa",
	"Kowal",
	"Degenerat",
	"Kaznik",
	"Zloczynca",
	"Pasterz",
	"Mistrz",
	"Elf",
	"Kanibal",
	"Pozeracz Mozgow",
	"Ludojad",
	"Konstrukt",
	"Kot",
	"Pan",
	"Nietoperz",
	"Zabojca",
	"Kolos",
	"Pasozyt",
	"Robak",
	"Zuk",
	"Tasiemiec",
	"Nieumarly",
	"Bohater",
	"Szumowina",
	"Jaszczur",
	"Warzywo",
	"Zlodziej",
	"Uczony",
	"Bobr",
	"Babel",
	"Kaleka",
	"Szakal",
	"Poszukiwacz",
	"Kaplan",
	"Urwis",
	"Ghul",
	"Dab",
	"Paranoik",
	"Kat",
	"Wladca",
	"Wedrowiec",
	"Nekromanta",
	"Medrzec",
	"Ignorant",
	"Mutant",
	"Osiol",
	"Straznik",
	"Wyrzutek",
	"Lowca",
	"Czarnoksieznik",
	"Beben",
	"Mlot",
	"Hebel",
	"Kleszcz",
	"Oszust",
	"Kanciarz",
	"Byk",
	"Ostrze",
	"Miecz Obosieczny",
	"Sierzant",
	"General",
	"Plwocina",
	"Poroniec",
	"Szef",
	"Lotrzyk",
	"Ugryzienie",
	"Kikut",
	"Kaleka",
	"Oko",
	"Duch",
	"Alchemik",
	"Czarodziej",
	"Szkodnik",
	"Zbawca",
	"Gnojowy",
	"Grzyb",
	"Szlam",
	"Nicpon",
	"Wampir",
	"Skrzynia",
	"Kret",
	"Mag",
	"Tlusty",
	"Korona",
	"Podmuch",
	"Spokoj",
	"Wrzod",
	"Ateista",
	"Pancernik",
	"Krolik",
	"Dzik",
	"Szpieg",
	"Bog",
	"Kupiec",
	"Zniedoleznialy",
	"Termit",
	"Wojownik",
	"Bohater",	
	"Guru",
	"Mistrz",
	"Zakon",
	"Los",
	"Troll",
	"Wojak",
	"Kompot",
	"Kielek",
	"Dziecko",
	"But",
	"Piesc",
	"Krol",
	"Ksiaze",
	"Hrabia",
	"Zlotnik",
	"Baron",
	"Gornik",
	"Smierdziel",
	"Ciern",
	"Czapka",
	"Monarcha",
	"Przywodca",
	"Krasnolud",
	"Olbrzym",
	"Nosiciel",	
	"Perfekcjonista",
	"Blizna",
	"Ciecie",
	"Idiota",
	"Eksperyment",
	"Trumna",
	"Kon",
	"Taniec",
	"Tunczyk",
	"Puch",
	"Kaprys",
	"Woznica",
	"Luk",
	"Miecz",
	"Topor",
	"Sztylet",
	"Kusza",
	"Lucznik",
	"Zwiadowca",
	"Delirium",
	"Rak",
	"Don",
	"Kucyk",
	"Poslaniec",
	"Garb",
	"Czaszka",
	"Krzyz",
	"Bambus",
	"Rabus",
	"Zakrzepica",
	"Rog",
	"Prog",
	"Horkruks",
	"Niespodzianka",
	"Choragiewka",
	"Strych",
	"Balagan",
	"Skrzynia",
	"Skunks",
	"Karas",
	"Kula",
	"Kwadrat",
	"Romb",
	"Sedzia",
	"Ojciec Chrzestny",
	"Swat",
	"Baran",
	"Sad",
	"Szczupak",
	"Osiol"
};

// Infusion->Preffix
const string StExt_MagicInfusionPreffix_Name[StExt_MagicInfusionPreffix_Max] = 
{
	"Niezwykly",
	"Ogromny",
	"Zdrowy",
	"Zly",
	"Zwierzecy",
	"Wytrzymaly",
	"Kamien",
	"Wsciekly",
	"Chyzy",
	"Uparty",
	"Niezniszczalny",
	"Potezny",
	"Piekielny",
	"Silny",
	"Zreczny",
	"Szczesliwy",
	"Chciwy",
	"Epicki",
	"Nieuchwytny",
	"Skapy",
	"Obcy",
	"Niewidzialny",
	"Ogromny",
	"Niszczycielski",
	"Zlowieszczy",
	"Przerazajacy",
	"Odporny",
	"Szepczacy",
	"Genialny",
	"Lsniacy",
	"Monumentalny",
	"Trupi",
	"Kuszacy",
	"Plonacy",
	"Krzepki",
	"Zebrowany",
	"Niespodziewany",
	"Astralny",
	"Blogoslawiony",
	"Przeklinajacy",
	"Opetany",
	"Cuchnacy",
	"Niebezpieczny",
	"Bogaty",
	"Przebiegly",
	"Nienawistny",
	"Bezczelny",
	"Zamrozony",
	"Oblakany",
	"Stalowy",
	"Zelazny",
	"Dziki",
	"Podly",
	"Kolczasty",
	"Agresywny",
	"Gruby",
	"Koscisty",
	"Wstretny",
	"Zardzewialy",
	"Cieknacy",
	"Gnojowy",
	"Krwawy",
	"Przeszywajacy",
	"Przenikliwy",
	"Zaczarowany",
	"Czarnoksieski",
	"Lsniacy",
	"Jasny",
	"Mroczny",
	"Blogoslawiony",
	"Zloty",
	"Magia",
	"Nieokielznany",
	"Boski",
	"Demoniczny",
	"Lepki",
	"Zywiolowy",
	"Krzywy",
	"Kolczasty",
	"Pasozytniczy",
	"Teczowy",
	"Punktualny",
	"Owlosiony",
	"Lysy",
	"Trujacy",
	"Zwinny",
	"Widmowy",
	"Szybki",
	"Kwasny",
	"Slodki",
	"Gorzki",
	"Plynacy",
	"Solidny",
	"Miekki",
	"Pobozny",
	"Zbezczeszczony",
	"Gleboki",
	"Moralny",
	"Tepy",
	"Ostry",
	"Rozlupujacy",
	"Doglebny",
	"Marny",
	"Znakomity",
	"Nieudany",
	"Powietrzny",
	"Olowiany",
	"Goracy",
	"Chlod",
	"Chlodny",
	"Prazacy",
	"Kaprysny",
	"Brodaty",
	"Drogi",
	"Tani",
	"Niezawodny",
	"Elitarny",
	"Zniedoleznialy",
	"Wyksztalcony",
	"Sprytny",
	"Intelektualny",
	"Ropiejacy",
	"Oszalamiajacy",
	"Paralizujacy",
	"Przeklety",
	"Bodacy",
	"Krystaliczny",
	"Krysztal",
	"Chrupiacy",
	"Tlusty",
	"Chudy",
	"Gesty",
	"Bezwartosciowy",
	"Garbaty",
	"Taranujacy",
	"Towarowy",
	"Zabalsamowany",
	"Musujacy",
	"Skomlacy",
	"Wrzeszczacy",
	"Zawodzacy",
	"Spiacy",
	"Oszalaly",
	"Spalony",
	"Zgnily",
	"Wiedzmi",
	"Napedzany",
	"Tajemniczy",
	"Odkopany",
	"Zaswiaty",
	"Mokry",
	"Suchy",
	"Gluchy",
	"Slepy",
	"Gniady",
	"Szary",
	"Zly",
	"Odurzajacy",
	"Jednoczacy",
	"Spocony",
	"Podziemny",
	"Niebianski",
	"Puszysty",
	"Zblakany",
	"Zabity",
	"Wsciekly",
	"Duchowy",
	"Duszny",
	"Rozowy",
	"Zielony",
	"Czerwony",
	"Niebieski",
	"Zolty",
	"Ugryziony",
	"Zdradziecki",
	"Zlodziejski",
	"Morski",
	"Rozdarty",
	"Szalejacy",
	"Cuchnacy",
	"Brudny",
	"Napiety",
	"Zajadly",
	"Trwaly",
	"Pijany",
	"Pijacy",
	"Spuchniety",
	"Skrzydlaty",
	"Zapchlony",
	"Zylasty",
	"Wychudzony",
	"Chory",
	"Radosny",
	"Zdziczaly",
	"Marny",
	"Nieumyty",
	"Niemy",
	"Grozny",
	"Biegnacy",
	"Zezowaty"
};

// Infusion->Suffix
const string StExt_MagicInfusionSuffix_Name[StExt_MagicInfusionSuffix_Max] = 
{
	"Chaos",
	"Zycie",
	"Zrecznosc",
	"Sila",
	"Ochrona",
	"Atak",
	"Ogien",
	"Lawa",
	"Chlod",
	"Lod",
	"Polnoc",
	"Magia",
	"Mrok",
	"Trucizna",
	"Krew",
	"Bol",
	"Wiatr",
	"Kamien",
	"Las",
	"Szlam",
	"Dolegliwosc",
	"Nekromancja",
	"Zar",
	"Zatrucie",
	"Zepsucie",
	"Ciecia",
	"Nieznane",
	"Miazmaty",
	"Eksplozja",
	"Ciernie",
	"Rytual",
	"Zaswiaty",
	"Sad Ostateczny",
	"Niebiosa",
	"Wiedniecie",
	"Przygnebienie",
	"Leczenie",
	"Szamanizm",
	"Rozklad",
	"Erupcja",
	"Ciernie",
	"Zaklecie",
	"Groby",
	"Apokalipsa",
	"Firmament",
	"Straty",
	"Beznadzieja",
	"Zepsucie",
	"Troll",
	"Przebiegly",
	"Starsi",
	"Odpornosc",
	"Rozwoj",
	"Spalenie",
	"Salamandra",
	"Mrozenie",
	"Mroz",
	"Runy",
	"Nieistnienie",
	"Odraza",
	"Bitwa",
	"Odparcie",
	"Huragan",
	"Gory",
	"Natura",
	"Uduszenie",
	"Zatracenie",
	"Entropia",
	"Pustynia",
	"Choroba",
	"Utrata Krwi",
	"Mistycyzm",
	"Odbicie",
	"Wampiryzm",
	"Wyciek",
	"Przywodztwo",
	"Jednosc",
	"Madrosc",
	"Natchnienie",
	"Eter",
	"Oszczerstwo",
	"Ziemia",
	"Bloto",
	"Golab",
	"Metal",
	"Zniewolenie",
	"Obietnice",
	"Umysl",
	"Przemoc",
	"Dziedzictwo",
	"Dobro",
	"Niepogoda",
	"Granit",
	"Wzrost",
	"Smutek",
	"Zysk",
	"Pech",
	"Szalenstwo",
	"Otchlan",
	"Bagno",
	"Zwloki",
	"Ohyda",
	"Kaluza",
	"Taran",
	"Adanos",
	"Beliar",
	"Innos",
	"Stonos",
	"Muchomor",
	"Para",
	"Kara",
	"Rozklad",
	"Niewola",
	"Piana",
	"Zal",
	"Noc",
	"Kleszcz",
	"Siarka",
	"Krysztal",
	"Kosa",
	"Mucha",
	"Grzebien",
	"Wola",
	"Cela",
	"Blokada",
	"Duma",
	"Harpia",
	"Golem",
	"Trupi",
	"Cmentarz",
	"Ziola",
	"Krzewy",
	"Burza",
	"Bagienny Czlowiek",
	"Egzekucja",
	"Tortury",
	"Porazka",
	"Taniec",
	"Koniec",
	"Nagroda",
	"Wojna",
	"Rownowaga",
	"Byk",
	"Przeciwnosci",
	"Demon",
	"Smok",
	"Koza",
	"Uriziel",
	"Mora",
	"Klatwa",
	"Ladunek",
	"Wolnosc",
	"Muchomor",
	"Tarcza",
	"Katharsis",
	"Kometa",
	"Podstep",
	"Ges",
	"Grad",
	"Refleks",
	"Zwinnosc",
	"Chytrosc",
	"Okrucienstwo",
	"Goblin",
	"Padlinozerca",
	"Przebicie",
	"Lanie",
	"Geniusz",
	"Weszyciel",
	"Rapier",
	"Slimak",
	"Wegle",
	"Ul",
	"Kwarc",
	"Zywica",
	"Dzwiek",
	"Zwyciestwo",
	"Moc",
	"Blogoslawiony",
	"Szlam",
	"Nieskonczonosc",
	"Glupota",
	"Odretwienie",
	"Mrozenie",
	"Wytrwalosc",
	"Nienawisc",
	"Koszmar",
	"Komar",
	"Handel Wymienny",
	"Piasek",
	"Ambrozja",
	"Plaz",
	"Karaluch",
	"Pajak",
	"Wiatr",
	"Owad",
	"Mrowka",
	"Mgla",
	"Szczur",
	"Pszczola",
	"Pole",
	"Wszechswiat",
	"Zaraza",
	"Istnienie",
	"Cud",
	"Grzmot",
	"Popiol",
	"Pletwa",
	"Mrok",
	"Okrucienstwo",
	"Cisza",
	"Podlosc",
	"Cierpienie",
	"Woda",
	"Stalowy",
	"Duch",
	"Strach",
	"Siec",
	"Namietnosc",
	"Czas",
	"Wrona",
	"Zuk"
};

// 				*** Mastery perks names ***
// Fire
const string StExt_Str_MasteryPerk_Name_0[StExt_MasteryPerk_Max] =
{
	"Zwiastun Popiolow",
	"Podpalacz",
	"Pokrewienstwo z Ogniem",
	"Lawowa Powloka",
	"Ognisty Duch",
	"Tchnienie Plomienia",
	"Spalenie",
	"Tchnienie Ognia",
	"Pirokinetyk",
	"Plonace Serce",
	"Dar Agniego",
	"Ognisty Legion",
	"Rzezbiarz Bazaltu",
	"Chodzacy po Ogniu",
	"Uderzenie Magmy",
	"Pozeracz Ognia"
};
const string StExt_Str_MasteryPerk_Desc_0[StExt_MasteryPerk_Max] =
{
	"+3 do obrazen od ognia dla dowolnej broni lub magii za kazdy poziom pirokinetyki",
	"+1 do obrazen od podpalenia dla dowolnej broni lub magii za kazdy poziom pirokinetyki",
	"+0,3% odpornosci na ogien za kazdy poziom pirokinetyki",
	"+1 do odpornosci na ogien za kazdy poziom pirokinetyki",
	"-10% kosztu many dla zaklec z komponentem ognia",
	"+1% do trwajacych obrazen od ognia za kazdy poziom pirokinetyki",
	"+50% do czasu trwania obrazen od ognia",
	"+25% do wszelkich obrazen od ognia",
	"+150 do obrazen od ognia dla dowolnej broni lub magii",
	"+50 do obrazen od podpalenia dla dowolnej broni lub magii",
	"Daje 10% szansy na rzucenie Kuli Ognia podczas ataku.",
	"Sludzy zyskuja zdolnosc rzucania Ognistego Pocisku.",
	"Ogniste golemy sa o 0,5% silniejsze za kazdy poziom pirokinetyki.",
	"+5% do odpornosci na ogien i +10% do maksymalnej odpornosci na ogien",
	"Dodaje 50% obrazen broni jako obrazenia od ognia.",
	"Przywraca zdrowie rowne 20% otrzymanych obrazen od ognia."
};
// Ice
const string StExt_Str_MasteryPerk_Name_1[StExt_MasteryPerk_Max] =
{
	"Zwiastun Lodu",
	"Oblodzenie",
	"Objecia Zimy",
	"Mrozny Duch",
	"Pokrewienstwo z Chlodem",
	"Lodowa Powloka",
	"Tchnienie Zimy",
	"Hydromanta",
	"Dar Adanosa",
	"Sniezny Legion",
	"Rzezbiarz Lodu",
	"Zamrozone Serce",
	"Lodowy Dryf",
	"Lodowa Skorupa",
	"Wodna Powloka",
	"Mroz"
};
const string StExt_Str_MasteryPerk_Desc_1[StExt_MasteryPerk_Max] =
{
	"+3 do obrazen magicznych dla obrazen od lodu za kazdy poziom hydromancji",
	"+1 do trwalych obrazen magicznych od lodu za kazdy poziom hydromancji",
	"+0,1% szansy na zamrozenie wroga podczas ataku za kazdy poziom hydromancji",
	"-10% kosztu many dla zaklec z komponentem lodu",
	"+0,3% odpornosci na magie za kazdy poziom hydromancji",
	"+1 do obrony przed magia za kazdy poziom hydromancji",
	"+1% do trwajacych obrazen magicznych od lodu za kazdy poziom hydromancji",
	"+25% do obrazen zaklec z komponentem lodu",
	"Daje 10% szansy na rzucenie Lodowej Lancy podczas ataku.",
	"Sludzy zyskuja zdolnosc rzucania Mroznego Pocisku.",
	"Lodowe golemy sa o 0,5% silniejsze za kazdy poziom hydromancji.",
	"+150 do obrazen magicznych dla dowolnej broni lub magii",
	"+5% odpornosci na magie i +10% do maksymalnej odpornosci na magie",
	"Dodaje 50% obrazen broni jako obrazenia magiczne.",
	"10% otrzymanych obrazen zostaje przywrocone jako mana",
	"10% szansy na zamrozenie atakujacego w walce wrecz"
};
// Electric
const string StExt_Str_MasteryPerk_Name_2[StExt_MasteryPerk_Max] =
{
	"Zwiastun Iskier",
	"Szok",
	"Paralizator",
	"Elektryczny Duch",
	"Zwarcie",
	"Naladowana Tarcza",
	"Transformator",
	"Elektromanta",
	"Dar Ampery",
	"Elektryczny Legion",
	"Przewodnik",
	"Naladowane Uderzenie",
	"Iskra",
	"Induktor",
	"Kondensator",
	"Zwarcie"
};
const string StExt_Str_MasteryPerk_Desc_2[StExt_MasteryPerk_Max] =
{
	"+3 do obrazen magicznych dla obrazen elektrycznych za kazdy poziom elektromancji",
	"+1 do trwalych obrazen magicznych od elektrycznosci za kazdy poziom elektromancji",
	"+0,1% szansy na ogluszenie wroga podczas ataku za kazdy poziom elektromancji",
	"-10% kosztu many dla zaklec z komponentem elektrycznym",
	"5% obrazen zostaje skradzione jako tarcza energii",
	"+10 do tarczy energii za kazdy poziom elektromancji",
	"+1% do trwajacych obrazen magicznych od elektrycznosci za kazdy poziom elektromancji",
	"+25% obrazen dla zaklec z komponentem elektrycznym",
	"Daje 10% szansy na rzucenie Pioruna podczas ataku.",
	"Sludzy zyskuja zdolnosc rzucania Mniejszej Blyskawicy.",
	"Od 1 do 3 obrazen elektrycznych w lancuchu, +1 za kazde 25 poziomow mistrzostwa.",
	"Daje +300 na start i +1 do obrazen magicznych za atak za kazdy poziom mistrzostwa.",
	"+5% do szybkosci wszystkich dzialan",
	"Atakujacy wrog otrzymuje 1-5 obrazen za kazdy poziom elektromancji.",
	"10% otrzymanych obrazen zostaje przywrocone jako tarcza energii",
	"Zadaje 25% obrazen broni jako obrazenia lancuchowej blyskawicy."
};
// Air
const string StExt_Str_MasteryPerk_Name_3[StExt_MasteryPerk_Max] =
{
	"Zwiastun Burzy",
	"Uduszenie",
	"Duch Powietrza",
	"Przeplyw Powietrza",
	"Niedotlenienie",
	"Lekkomyslnosc",
	"Oko Burzy",
	"Huragan",
	"Aeromanta",
	"Dar z Niebios",
	"Legion Powietrza",
	"Rzezbiarz Huraganu",
	"Podmuch Wiatru",
	"Tarcza Powietrza",
	"Pomyslny Wiatr",
	"Proznia"
};
const string StExt_Str_MasteryPerk_Desc_3[StExt_MasteryPerk_Max] =
{
	"+3 do obrazen odrzutu dla dowolnej broni lub magii za kazdy poziom aeromancji",
	"+1 do obrazen duszenia dla dowolnej broni lub magii za kazdy poziom aeromancji",
	"-10% kosztu many dla zaklec z komponentem powietrza",
	"+150 do obrazen odrzutu dla dowolnej broni lub magii",
	"+1% do trwajacych obrazen od uduszenia za kazdy poziom aeromancji",
	"+0,1% szansy na unik trafienia za kazdy poziom aeromancji",
	"+1% do czasu trwania uduszenia za kazdy poziom aeromancji",
	"+25% do obrazen obszarowych",
	"+25% obrazen dla zaklec z komponentem powietrza",
	"10% szansy na rzucenie Tornada podczas ataku",
	"Sludzy zyskuja zdolnosc rzucania Tornada.",
	"Golemy powietrza sa o 0,5% silniejsze za kazdy poziom aeromancji.",
	"Dodaje 50% obrazen broni jako obrazenia odrzutu.",
	"+0,2% szansy na odbicie pocisku za kazdy poziom aeromancji",
	"1% regeneracji zycia i many podczas biegu",
	"+50 do obrazen duszenia dla calej broni i magii"
};
// Earth
const string StExt_Str_MasteryPerk_Name_4[StExt_MasteryPerk_Max] =
{
	"Hart Ducha",
	"Kamienna Skora",
	"Duch Ziemi",
	"Wstrzas",
	"Rzezbiarz Kamienia",
	"Miazdzenie",
	"Kamienna Piesc",
	"Geomanta",
	"Dar Stonosa",
	"Kamienny Legion",
	"Moc Ziemi",
	"Punkt Zwrotny",
	"Tarcza Ziemi",
	"Granitowa Zbroja",
	"Obciaznik",
	"Odrzut"
};
const string StExt_Str_MasteryPerk_Desc_4[StExt_MasteryPerk_Max] =
{
	"+2 do ochrony przed odrzutem za kazdy poziom geomancji",
	"+0,1% odpornosci na obrazenia obuchowe, sieczne i klute za kazdy poziom geomancji",
	"-10% kosztu many dla zaklec z komponentem kamienia",
	"+0,1% szansy na ogluszenie wroga za kazdy poziom geomancji",
	"Golemy kamienne i bagienne sa o 0,5% silniejsze za kazdy poziom geomancji.",
	"+1 do obrazen miazdzacych dla dowolnej broni lub magii za kazdy poziom geomancji",
	"+3 do obrazen obuchowych dla dowolnej broni lub magii za kazdy poziom geomancji",
	"+25% obrazen dla zaklec z komponentem kamienia",
	"Daje 10% szansy na rzucenie Kamiennej Piesci podczas ataku.",
	"Sludzy zyskuja zdolnosc rzucania Kamiennej Piesci.",
	"+150 do obrazen obuchowych dla dowolnej broni i magii",
	"+50 do obrazen miazdzacych dla dowolnej broni i magii",
	"+1 do ochrony przed obrazeniami miazdzacymi i siecznymi za kazdy poziom geomancji",
	"Atakujacy wrog otrzymuje 3 obrazenia obuchowe w walce wrecz za kazdy poziom geomancji.",
	"Dodaje 50% obrazen broni jako obrazenia obuchowe.",
	"10% szansy na ogluszenie atakujacego wroga"
};
// Light
const string StExt_Str_MasteryPerk_Name_5[StExt_MasteryPerk_Max] =
{
	"Prawosc",
	"Pobozny",
	"Swiety Duch",
	"Swietosc",
	"Tarcza Wiary",
	"Blogoslawiony",
	"Silna Wiara",
	"Dar Innosa",
	"Prawa Armia",
	"Dogmatyzm",
	"Patronat",
	"Upor",
	"Amulet",
	"Natchnienie",
	"Niezlomnosc",
	"Przywodztwo"
};
const string StExt_Str_MasteryPerk_Desc_5[StExt_MasteryPerk_Max] =
{
	"Atakujacy nieumarli i zli wrogowie otrzymuja 20% odbitych obrazen jako obrazenia od ognia.",
	"+25% obrazen przeciw nieumarlym i zlu",
	"-10% kosztu many dla zaklec z komponentem swietym",
	"+25% obrazen dla zaklec z komponentem swietym",
	"+10 do tarczy energii za kazdy poziom jasnej magii",
	"+0,3% regeneracji zycia i tarczy energii na sekunde",
	"10% obrazen otrzymanych od nieumarlych zostaje przywrocone jako tarcza energii i zycie.",
	"Daje 10% szansy na rzucenie Swietej Strzaly podczas ataku.",
	"Sludzy zyskuja zdolnosc rzucania 'Swietej Strzaly'",
	"Daje +50 na start i +3 pozniej do obrazen przeciw nieumarlym i zlu za kazdy poziom jasnej magii.",
	"Atakujacy wrog otrzymuje 5 obrazen od ognia za kazdy poziom swietej magii.",
	"+5% odpornosci na wszelkie rodzaje obrazen",
	"Podczas ataku jest 10% szansy, ze ty i twoi sojusznicy zyskacie +3 do obrony przed wszystkim za kazdy poziom jasnej magii.",
	"Podczas ataku jest 10% szansy, ze ty i twoi sojusznicy zyskacie +10 zycia za kazdy poziom jasnej magii.",
	"Podczas ataku jest 10% szansy, ze ty i twoi sojusznicy otrzymacie +3 do regeneracji statystyk za kazdy poziom jasnej magii.",
	"Podczas ataku jest 10% szansy, ze ty i twoi sojusznicy otrzymacie +3 do obrazen za kazdy poziom jasnej magii."
};
// Dark
const string StExt_Str_MasteryPerk_Name_6[StExt_MasteryPerk_Max] =
{
	"Agonia",
	"Zepsucie",
	"Mroczny Duch",
	"Wladca Mroku",
	"Ucisk",
	"Rzucajacy Klatwy",
	"Oslona Mroku",
	"Zniewalacz",
	"Mroczny Rzezbiarz",
	"Demoniczny Dar",
	"Mroczny Legion",
	"Dlon Beliara",
	"Wysysacz Zycia",
	"Upadek",
	"Podatnosc",
	"Plugastwo"
};
const string StExt_Str_MasteryPerk_Desc_6[StExt_MasteryPerk_Max] =
{
	"+3 do obrazen mrocznej magii za kazdy poziom mistrzostwa",
	"+1 do trwajacych obrazen od mroku za kazdy poziom mistrzostwa",
	"-10% kosztu many dla zaklec z komponentem mrocznym",
	"+25% obrazen dla zaklec z komponentem mrocznym",
	"+50% do czasu trwania trwajacych obrazen od mroku",
	"+1% do czasu trwania zaklec mroku za kazdy poziom mistrzostwa",
	"10% szansy na rzucenie losowej klatwy na pobliskich wrogow",
	"+0,3% szansy na zniewolenie swiadomosci celu podczas ataku za kazdy poziom mrocznej magii",
	"Golemy cienia sa o 0,5% silniejsze za kazdy poziom mrocznej magii.",
	"Daje 10% szansy na rzucenie Kuli Mroku podczas ataku.",
	"Sludzy zyskuja zdolnosc rzucania Mrocznej Strzaly.",
	"Podczas ataku atakujacy przekazuje ci 0,5% swojego zdrowia.",
	"Podczas ataku jest 10% szansy na rzucenie klatwy kradnacej 1 punkt zycia wroga za kazde 5 poziomow mrocznej magii.",
	"Podczas ataku jest 10% szansy na nalozenie klatwy oslabiajacej statystyki celu o 0,5% za kazdy poziom mrocznej magii.",
	"Podczas ataku jest 10% szansy na rzucenie klatwy oslabiajacej obrone celu o 3 za kazdy poziom mrocznej magii.",
	"Dodaje 50% obrazen broni jako trwajace obrazenia mrocznej magii."
};
// Death
const string StExt_Str_MasteryPerk_Name_7[StExt_MasteryPerk_Max] =
{
	"Poslaniec Zaglady",
	"Wiedniecie",
	"Duch Cmentarza",
	"Dlon Umarlaka",
	"Dzwon Zalobny",
	"Wezwanie Grobu",
	"Insygnia Smierci",
	"Legiony Smierci",
	"Wola Licza",
	"Pozeracz Smierci",
	"Masowa Smierc",
	"Ponury Zniwiarz",
	"Mag Smierci",
	"Kosciana Egida",
	"Chor Umarlych",
	"Ofiarne Ostrze"
};
const string StExt_Str_MasteryPerk_Desc_7[StExt_MasteryPerk_Max] =
{
	"+3 do obrazen magii smierci za kazdy poziom mistrzostwa",
	"+1 do trwajacych obrazen magii smierci za kazdy poziom mistrzostwa",
	"-10% kosztu many dla zaklec z komponentem smierci",
	"+150 do obrazen magicznych dla dowolnej broni lub magii",
	"0,1% obrazen zostaje skradzione jako zdrowie za kazdy poziom magii smierci.",
	"+25% obrazen przeciw zwierzetom, ludziom i orkom dla dowolnej broni",
	"Daje 10% szansy na rzucenie Kuli Smierci podczas ataku.",
	"Sludzy zyskuja zdolnosc rzucania Pocisku Smierci.",
	"Atakowanie zywych wrogow zadaje 5 obrazen magii smierci za kazdy poziom mistrzostwa.",
	"20% obrazen otrzymanych od zaklec smierci zostaje przywrocone jako zycie.",
	"Wszystkie zaklecia smierci zyskuja dodatkowe obrazenia obszarowe.",
	"Zaklecia smierci zadaja dodatkowe +1% obrazen magicznych przeciw zywym wrogom za kazdy poziom mistrzostwa.",
	"Zaklecia smierci sa o 25% silniejsze.",
	"+1 do obrony przed magia za kazdy poziom magii smierci",
	"Dodaje 50% obrazen zadawanych przez zaklecia smierci jako obrazenia magiczne w czasie.",
	"Dodaje 50% obrazen broni jako dodatkowe obrazenia magiczne przeciw zywym wrogom."
};
// Life
const string StExt_Str_MasteryPerk_Name_8[StExt_MasteryPerk_Max] =
{
	"Regeneracja",
	"Milosnik Zwierzat",
	"Wladca Roju",
	"Weterynarz",
	"Przywodca Watahy",
	"Stroz Nory",
	"Troskliwy Wlasciciel",
	"Treser",
	"Swiezosc",
	"Wilkolak",
	"Zdrowie Niedzwiedzia",
	"Lwie Serce",
	"Skora Bizona",
	"Ugryzienie Wilka",
	"Zadlo Pszczoly",
	"Kiel Weza"
};
const string StExt_Str_MasteryPerk_Desc_8[StExt_MasteryPerk_Max] =
{
	"Zaklecia leczace daja dodatkowe 0,1% regeneracji zycia na sekunde za kazdy poziom magii zycia.",
	"Przyzwane zwierzeta sa o 1% silniejsze za kazdy poziom magii zycia.",
	"Przyzwane zwierzeta maja +5 do obrazen trujacych za kazdy poziom magii zycia.",
	"Przyzwane zwierzeta maja o 50% wiecej zdrowia.",
	"Przyzwane zwierzeta maja o 25% wiecej statystyk",
	"Przyzwane zwierzeta maja o 25% wiecej obrony.",
	"Przyzwane zwierzeta regeneruja 0,1% zycia za kazdy poziom magii zycia.",
	"Przyzwane zwierzeta zyskuja dodatkowe +0,1% szansy na unik atakow za kazdy poziom magii zycia.",
	"Regeneracja zycia i wytrzymalosci +1% na sekunde",
	"Przemiana w zwierze jest o 1% silniejsza za kazdy poziom magii zycia.",
	"Przemiany w zwierzeta zyskuja o 50% wiecej zdrowia.",
	"Przemiany w zwierzeta zyskuja o 25% wiecej statystyk.",
	"Przemiany w zwierzeta zyskuja o 25% wiecej obrony.",
	"Przemiana w zwierze ma +5 do obrazen siecznych za kazdy poziom magii zycia.",
	"Przemiana w zwierze ma +5 do obrazen klutych za kazdy poziom magii zycia.",
	"Przemiana w zwierze zadaje +5 obrazen trujacych za kazdy poziom magii zycia."
};
// Golem
const string StExt_Str_MasteryPerk_Name_9[StExt_MasteryPerk_Max] =
{
	"Rzezbiarz",
	"Wiecznosc Gor",
	"Szczyt Rzemiosla",
	"Krzemienny Szczyt",
	"Granitowa Granica",
	"Samonaprawa",
	"Kamien Runiczny",
	"Kopalnia Rteci",
	"Kopalnie Siarki",
	"Krysztalowy Wawoz",
	"Wysoka Gran",
	"Zeliwna Piesc",
	"Uderzenie Mlota",
	"Ogluszony",
	"Akumulacja",
	"Wstrzas"
};
const string StExt_Str_MasteryPerk_Desc_9[StExt_MasteryPerk_Max] =
{
	"Przyzwane golemy sa o 1% silniejsze za kazdy poziom tworzenia golemow.",
	"Przyzwane golemy zyskuja o 50% wiecej zdrowia.",
	"Przyzwane golemy zyskuja o 25% wiecej statystyk.",
	"Przyzwane golemy otrzymuja o 25% wiecej obrazen.",
	"Przyzwane golemy zyskuja o 25% wiecej obrony.",
	"Przyzwane golemy regeneruja +1% zdrowia na sekunde",
	"Przyzwane golemy zyskuja tarcze energii rowna 25% ich maksymalnego zdrowia.",
	"Przyzwane golemy sa o 0,3% szybsze za kazdy poziom tworzenia golemow.",
	"Przyzwane golemy zyskuja dodatkowe +3 do obrazen od ognia za kazdy poziom tworzenia golemow.",
	"Przyzwane golemy zyskuja dodatkowe +3 do obrazen magicznych za kazdy poziom tworzenia golemow.",
	"Przyzwane golemy zyskuja dodatkowe +3 do obrazen odrzutu za kazdy poziom tworzenia golemow.",
	"Przyzwane golemy zyskuja dodatkowe +3 do obrazen obuchowych za kazdy poziom tworzenia golemow.",
	"Przyzwane golemy zadaja +3 obrazenia miazdzace za kazdy poziom tworzenia golemow.",
	"Przyzwane golemy maja 0,3% szansy na ogluszenie wroga za kazdy poziom tworzenia golemow.",
	"Przyzwane golemy przywracaja zdrowie rowne 20% otrzymanych obrazen.",
	"Przyzwane golemy zyskuja zdolnosc 'Wstrzas'."
};
// Demon
const string StExt_Str_MasteryPerk_Name_10[StExt_MasteryPerk_Max] =
{
	"Demonolog",
	"Piekielne Zdrowie",
	"Demoniczne Dziedzictwo",
	"Moc Eligora",
	"Diabelski Patronat",
	"Polaczenie z Inferno",
	"Eteryczna Esencja",
	"Plomien Eligora",
	"Ostre Szpony",
	"Zaklety Kiel",
	"Rozdarcie Duszy",
	"Nieswiety Rytual",
	"Demoralizacja",
	"Dlon Nergala",
	"Dlon Piekla",
	"Materializacja"
};
const string StExt_Str_MasteryPerk_Desc_10[StExt_MasteryPerk_Max] =
{
	"Przyzwane demony sa o 1% silniejsze za kazdy poziom demonologii.",
	"Przyzwane demony zyskuja o 50% wiecej zdrowia.",
	"Przyzwane demony zyskuja o 25% wiecej statystyk.",
	"Przyzwane demony otrzymuja o 25% wiecej obrazen.",
	"Przyzwane demony zyskuja o 25% wiecej obrony.",
	"Przyzwane demony regeneruja +0,5% zdrowia na sekunde",
	"Przyzwane demony zyskuja tarcze energii rowna 25% ich maksymalnego zdrowia.",
	"Przyzwane demony zyskuja dodatkowe +3 do obrazen od ognia za kazdy poziom demonologii.",
	"Przyzwane demony zyskuja dodatkowe +3 do obrazen siecznych za kazdy poziom demonologii.",
	"Przyzwane demony zyskuja dodatkowe +3 do obrazen magicznych za kazdy poziom demonologii.",
	"Przyzwane demony kradna 5% zadanych obrazen jako zdrowie.",
	"Podczas ataku demony moga nalozyc klatwe oslabiajaca statystyki celu o 0,5% za kazdy poziom demonologii.",
	"Podczas ataku demony maja szanse nalozyc klatwe oslabiajaca obrone celu o 0,5% za kazdy poziom demonologii.",
	"Demony zyskuja zdolnosc rzucania 'Kuli Mroku'",
	"Demony zyskuja zdolnosc rzucania 'Kuli Ognia'",
	"Demony zyskuja zdolnosc rzucania 'Mgnienia'"
};
// Necro
const string StExt_Str_MasteryPerk_Name_11[StExt_MasteryPerk_Max] =
{
	"Nekromanta",
	"Balsamowanie",
	"Taniec Smierci",
	"Furia Umarlych",
	"Wzmacnianie Kosci",
	"Polaczenie z Cmentarzem",
	"Runiczne Cialo",
	"Piesc z Ciala",
	"Smiertelne Ciecie",
	"Kosciany Kolec",
	"Zaklete Cialo",
	"Trupi Jad",
	"Wampiryzm",
	"Kosciana Tarcza",
	"Martwa Zrecznosc",
	"Palec Smierci"
};
const string StExt_Str_MasteryPerk_Desc_11[StExt_MasteryPerk_Max] =
{
	"Przyzwani nieumarli sa o 1% silniejsi za kazdy poziom nekromancji.",
	"Przyzwani nieumarli zyskuja o 50% wiecej zdrowia.",
	"Przyzwani nieumarli zyskuja o 25% wiecej statystyk",
	"Przyzwani nieumarli otrzymuja o 25% wiecej obrazen.",
	"Przyzwani nieumarli zyskuja o 25% wiecej obrony.",
	"Przyzwani nieumarli regeneruja +0,5% zdrowia na sekunde",
	"Przyzwani nieumarli zyskuja tarcze energii rowna 25% ich maksymalnego zdrowia.",
	"Przyzwani nieumarli zyskuja dodatkowe +3 do obrazen obuchowych za kazdy poziom nekromancji.",
	"Przyzwani nieumarli zyskuja dodatkowe +3 do obrazen siecznych za kazdy poziom nekromancji.",
	"Przyzwani nieumarli zyskuja dodatkowe +3 do obrazen klutych za kazdy poziom nekromancji.",
	"Przyzwani nieumarli zyskuja dodatkowe +3 do obrazen magicznych za kazdy poziom nekromancji.",
	"Przyzwani nieumarli zadaja +3 obrazenia trujace za kazdy poziom nekromancji.",
	"Przyzwani nieumarli kradna 5% zadanych obrazen jako zdrowie.",
	"Przyzwani nieumarli odbijaja 5% otrzymanych obrazen",
	"Przyzwani nieumarli sa o 0,3% szybsi za kazdy poziom nekromancji.",
	"Przyzwani nieumarli zyskuja zdolnosc rzucania 'Kuli Smierci'"
};
// Shaman
const string StExt_Str_MasteryPerk_Name_12[StExt_MasteryPerk_Max] =
{
	"Bariera Energii",
	"Duchowe Cialo",
	"Astralny Trans",
	"Runiczne Wiazanie",
	"Przewidywanie",
	"Oszczednosc",
	"Zaklinacz",
	"Zywiolak",
	"Czarnoksieska Bron",
	"Narzedzie Czarnoksieznika",
	"Oszczedzanie",
	"Gleboka Medytacja",
	"Eteryczny Wampiryzm",
	"Szaman",
	"Furia Przodkow",
	"Duchowe Polaczenie"
};
const string StExt_Str_MasteryPerk_Desc_12[StExt_MasteryPerk_Max] =
{
	"+500 do maksymalnej tarczy energii",
	"+5 do maksymalnej tarczy energii za kazdy poziom magii ducha",
	"+0,1% regeneracji tarczy energii za kazdy poziom magii ducha",
	"Wartosc ochrony magicznej szat jest dodawana jako dodatkowa tarcza energii,",
	"10% otrzymanych obrazen zostaje przywrocone jako tarcza energii",
	"10% otrzymanych obrazen zostaje przywrocone jako mana",
	"+1% obrazen dla broni magicznej za kazdy poziom magii ducha",
	"+1% do obrazen zywiolowych i magicznych broni za kazdy poziom magii ducha",
	"+25% obrazen dla magicznych ostrzy",
	"+25% obrazen dla magicznych kijow",
	"-10% kosztu many dla wszystkich zaklec",
	"+1% regeneracji many",
	"Kradnie 0,1% tarczy energii i many za kazdy poziom magii ducha.",
	"+1% do mocy totemow za kazdy poziom magii ducha",
	"+10 dodatkowych obrazen od ognia dla totemow za kazdy poziom magii ducha",
	"Totemy zyskuja zdolnosc rzucania 'Masowego Leczenia'"
};
// MartialArts
const string StExt_Str_MasteryPerk_Name_13[StExt_MasteryPerk_Max] =
{
	"Amator Broni Dwurecznej",
	"Amator Broni Jednorecznej",
	"Amator Podwojnej Broni",
	"Uderzenie Taranem",
	"Wojownik Mlota",
	"Kat",
	"Wlocznik",
	"Szalony Wir",
	"Wojownik Broni Dwurecznej",
	"Wojownik Broni Jednorecznej",
	"Wojownik Dwoch Broni",
	"Najemnik",
	"Straznik",
	"Skrytobojca",
	"Weteran Walki",
	"Wojak"
};
const string StExt_Str_MasteryPerk_Desc_13[StExt_MasteryPerk_Max] =
{
	"+1% obrazen bronia dwureczna za kazdy poziom mistrzostwa wojownika",
	"+1% obrazen bronia jednoreczna za kazdy poziom mistrzostwa wojownika",
	"+1% obrazen przy walce dwiema broniami za kazdy poziom mistrzostwa wojownika",
	"+0,1% szansy na ogluszenie wroga podczas ataku za kazdy poziom mistrzostwa wojownika",
	"+5 do obrazen obuchowych w walce wrecz za kazdy poziom mistrzostwa wojownika",
	"+5 do obrazen siecznych w walce wrecz za kazdy poziom mistrzostwa wojownika",
	"+5 do obrazen klutych w walce wrecz za kazdy poziom mistrzostwa wojownika",
	"Obrazenia bronia do walki wrecz obejmuja tez pobliskie cele",
	"+25% obrazen bronia dwureczna", 
	"+25% obrazen bronia jednoreczna",
	"+25% obrazen przy walce dwiema broniami", 
	"+3 do obrazen siecznych w walce wrecz za kazdy poziom mistrzostwa wojownika",
	"+3 do obrazen rozlupujacych w walce wrecz za kazdy poziom mistrzostwa wojownika",
	"+3 do obrazen klutych w walce wrecz za kazdy poziom mistrzostwa wojownika",
	"Kazdy poziom bieglosci w broni do walki wrecz powyzej 100% zwieksza obrazenia o 1%",
	"+0,5% obrazen w walce wrecz za kazdy poziom mistrzostwa wojownika"
};

// Agile
const string StExt_Str_MasteryPerk_Name_14[StExt_MasteryPerk_Max] =
{
	"Ochrona przed miazdzeniem",
	"Ochrona przed cieciem",
	"Ochrona przed Ogniem",
	"Ochrona przed odrzutem",
	"Ochrona przed magia",
	"Ochrona przed przebiciem",
	"Zbrojny",
	"Tarczownik",
	"Zwinnosc",
	"Kontratak",
	"Wytrzymalosc",
	"Przygotowanie",
	"Runiczne Hartowanie",
	"Niedostepnosc",
	"Oblezony",
	"Laska"
};
const string StExt_Str_MasteryPerk_Desc_14[StExt_MasteryPerk_Max] =
{
	"+1 do obrony przed obrazeniami obuchowymi za kazdy poziom mistrzostwa obrony",
	"+1 do obrony przed obrazeniami siecznymi za kazdy poziom mistrzostwa obrony",
	"+1 do obrony przed obrazeniami od ognia za kazdy poziom mistrzostwa obrony",
	"+1 do odpornosci na obrazenia odrzutu za kazdy poziom mistrzostwa obrony",
	"+1 do ochrony przed obrazeniami magicznymi za kazdy poziom mistrzostwa obrony",
	"+1 do obrony przed obrazeniami klutymi za kazdy poziom mistrzostwa obrony",
	"Zbroja jest o 25% skuteczniejsza",
	"Przy noszeniu tarczy obrona wzrasta o 0,5% za kazdy poziom umiejetnosci.",
	"+0,1% szansy na unik ataku za kazdy poziom mistrzostwa obrony",
	"Atakujacy otrzymuje 5% odbitych obrazen.",
	"+10% do maksimum wszystkich odpornosci i +0,1% do wszystkich odpornosci za kazdy poziom mistrzostwa obrony",
	"20% otrzymanych obrazen zostaje przywrocone jako zdrowie",
	"+0,1% szansy na pochloniecie zaklecia za kazdy poziom mistrzostwa obrony",
	"+10% szansy na zablokowanie wszystkich obrazen podczas trzymania tarczy",
	"+0,5% szansy na ogluszenie atakujacego za kazdy poziom mistrzostwa obrony podczas trzymania tarczy",
	"+0,1% szansy na odbicie pociskow"
};
// Archery
const string StExt_Str_MasteryPerk_Name_15[StExt_MasteryPerk_Max] =
{
	"Strzelec",
	"Amator Luku",
	"Amator Kuszy",
	"Miazdzacy Strzal",
	"Weteran Lucznictwa",
	"Przeszywajacy Strzal",
	"Zatruta Strzala",
	"Salwa",
	"Rykoszet",
	"Celny Strzal",
	"Umiejetnosc",
	"Lowca",
	"Zabojca",
	"Pogromca Orkow",
	"Niszczyciel Zla",
	"Pogromca Golemow"
};
const string StExt_Str_MasteryPerk_Desc_15[StExt_MasteryPerk_Max] =
{
	"+0,5% obrazen dystansowych za kazdy poziom mistrzostwa strzelectwa",
	"+1% obrazen z luku za kazdy poziom mistrzostwa lucznictwa",
	"+1% obrazen z kuszy za kazdy poziom mistrzostwa strzelectwa",
	"+3 do obrazen obuchowych na dystans za kazdy poziom mistrzostwa strzelectwa",
	"Kazdy poziom bieglosci w broni dystansowej powyzej 100% zwieksza obrazenia o 1%",
	"+3 do obrazen klutych na dystans za kazdy poziom mistrzostwa strzelectwa",
	"+3 do obrazen trujacych na dystans za kazdy poziom mistrzostwa strzelectwa",
	"+10% szansy na zadanie podwojnych obrazen dystansowych",
	"Obrazenia strzaly obejmuja tez pobliskie cele.",
	"+0,3% szansy na ogluszenie wroga atakiem dystansowym za kazdy poziom mistrzostwa strzelectwa",
	"+10% do szybkosci wszystkich dzialan",
	"+1% obrazen przeciw zwierzetom w walce dystansowej za kazdy poziom mistrzostwa strzelectwa",
	"+1% obrazen przeciw ludziom w walce dystansowej za kazdy poziom mistrzostwa strzelectwa",
	"+1% obrazen przeciw orkom w walce dystansowej za kazdy poziom mistrzostwa strzelectwa",
	"+1% obrazen przeciw nieumarlym i zlu w walce dystansowej za kazdy poziom mistrzostwa strzelectwa",
	"+1% obrazen przeciw golemom w walce dystansowej za kazdy poziom mistrzostwa strzelectwa"
};

// generic perks
const string StExt_Str_Perk_Name[StExt_Perk_Max] =
{
	"Uczen",
	"Rytualista",
	"Gruba Skora",
	"Dziedzictwo Przodkow",
	"Atleta",
	"Uzupelnienie",
	"Wszechstronnosc",
	"Hojnosc",
	"Stalowa Wola",
	"Bogata Aura",
	"Horyzont",
	"Mag Bojowy",
	"Chciwy",
	"Szczesciarz",
	"Nowicjusz Walki",
	"Nowicjusz Strzelectwa",
	"Poczatkujacy Magik",
	"Umysl nad Materia",
	"Kieszonkowiec",
	"Atrybut Czarnoksieznika",
	"Przewodnik Magii",
	"Szermierz",
	"Kat",
	"Szermierz",
	"Wlocznik",
	"Halabardnik",
	"Oburecznosc",
	"Lucznik",
	"Kusznik",
	"Zwinnosc",
	"Podwojny Strzal",
	"Arcymag",
	"Doswiadczony Szermierz",
	"Dotyk Zepsucia",
	"Pozeracz Esencji",
	"Hartowanie",
	"Weteran Magii",
	"Paladyn",
	"Trwalosc Zwierciadla",
	"Wieczna Hartownosc",
	"Magiczny Ladunek",
	"Pozeracz Bolu"
};
const string StExt_Str_Perk_Desc[StExt_Perk_Max] =
{
	"+1 do maksymalnej liczby studiowanych szkol magii lub sztuk walki",
	"+1 do maksymalnej liczby przyzwanych stworzen i kolejne +1 za kazde 500 inteligencji",
	"+0,5% regeneracji witalnosci na sekunde",
	"+0,5% regeneracji mocy magicznej na sekunde",
	"+0,5% regeneracji wytrzymalosci na sekunde",
	"+0,5% regeneracji tarczy energii na sekunde",
	"+1 do maksymalnej liczby aktywnych aur i kolejne +1 za kazde 35 poziomow bohatera",
	"Aury dzialaja tak samo na przyzwane stworzenia i sojusznikow.",
	"+5 do mocy aury za kazdy poziom bohatera",
	"Zmniejszenie rezerwacji zasobow przez aury o 25%",
	"+5 do zasiegu aury za kazdy poziom bohatera",
	"+10% szansy na obrazenia krytyczne zakleciami. Obrazenia krytyczne zaklec zwiekszone o 25%.",
	"+25% do ilosci znajdowanego zlota",
	"+5% do szczescia",
	"+100 do obrazen w walce wrecz i kolejne +5 za kazdy poziom",
	"+100 do obrazen dystansowych i kolejne +5 za kazdy poziom",
	"+100 do obrazen magicznych i kolejne +5 za kazdy poziom",
	"Obrazenia sa najpierw pobierane z many zamiast ze zdrowia",
	"+10% szansy na udana kradziez",
	"Przyzwane stworzenia sa o 0,1% silniejsze za kazdy punkt obrazen zadawanych przez magiczna bron w ich rekach.",
	"+0,1% obrazen magicznych za kazdy punkt obrazen zadawanych przez magiczna bron w twoich rekach",
	"+25% dodatkowych obrazen mieczami",
	"+25% dodatkowych obrazen toporami",
	"+25% dodatkowych obrazen rapierami i lekkimi mieczami",
	"+25% dodatkowych obrazen wloczniami",
	"+25% dodatkowych obrazen halabardami",
	"+25% dodatkowych obrazen przy walce dwiema broniami",
	"+25% dodatkowych obrazen z luku",
	"+25% dodatkowych obrazen z kuszy",
	"+10% do szybkosci wszystkich dzialan",
	"10% szansy na podwojny strzal z luku lub kuszy (przy trafieniu)",
	"Zaklecia zuzywaja dwukrotnie wiecej many. Zaklecia zyskuja dodatkowy bonus zalezny od aktualnej many.",
	"Obrazenia bronia zuzywaja dodatkowa wytrzymalosc przy trafieniu. Obrazenia bronia otrzymuja bonus zalezny od aktualnej wytrzymalosci.",
	"Odblokowuje mozliwosc rozwijania bohatera na podstawie zadanych obrazen. -25% zdobywanego doswiadczenia.",
	"Bonusy za zabijanie potworow sa nadal przyznawane po otrzymaniu glownego bonusu.",
	"+10% redukcji obrazen i kolejne +0,1% za kazdy poziom bohatera.",
	"Bonus do obrazen zaklec z noszenia szaty jest zawsze aktywny, ze zbroja lub bez niej.",
	"Ogolna ochrona zbroi jest dodawana jako dodatkowa tarcza energii.",
	"+50% odpornosci na obrazenia odbite.",
	"+50% odpornosci na obrazenia w czasie.",
	"Zuzywa do 5% many na dodatkowe obrazenia magiczne broni.",
	"Obrazenia sa najpierw pobierane z wytrzymalosci zamiast ze zdrowia."
};

// corruption perks
const string StExt_Corruption_Perk_Name_Mage[StExt_CorruptionPerk_Max] =
{
	"Rytual Ofiarny",
	"Wewnetrzne Rezerwy",
	"Schronienie",
	"Zaradnosc",
	"Czarnoksieznik",
	"Nasycenie Esencja",
	"Nieswiety Straznik",
	"Marzyciel",
	"Przewidywanie",
	"Przewidywanie",
	"Echo Magii",
	"Zlodziej Dusz",
	"Mysliciel",
	"Natchnienie Bolem",
	"Slub Fanatyka",
	"Mistyczny Akumulator",
	"Mnich",
	"Adept",
	"Silna Wola",
	"Niestabilnosc Slug"
};
const string StExt_Corruption_Perk_Name_Warrior[StExt_CorruptionPerk_Max] =
{
	"Rytual Ofiarny",
	"Wewnetrzne Rezerwy",
	"Goliat",
	"Atleta",
	"Adrenalina",
	"Niepokonywalnosc",
	"Bezkrwisty",
	"Wieczna Mlodosc",
	"Droga Wojownika",
	"Barbarzynstwo",
	"Dyscyplina",
	"Przygotowanie",
	"Zdrowe Cialo",
	"Kanibal",
	"Diamentowa Skora",
	"Szalenstwo Bitwy",
	"Wyszkolenie Wojskowe",
	"Pogromca",
	"Parowanie",
	"Rownowaga"
};
const string StExt_Corruption_Perk_Name_Ranger[StExt_CorruptionPerk_Max] =
{
	"Rytual Ofiarny",
	"Taniec Ducha",
	"Zaradnosc",
	"Potezne Przebicie",
	"Balistyka",
	"Medycyna Polowa",
	"Atleta",
	"Lekkostopy",
	"Zadza Krwi",
	"Ciche Kroki",
	"Rozdzielony Strzal",
	"Pradawna Moc",
	"Plaszcz Cierni",
	"Laska",
	"Smiercionosne Toksyny",
	"Strzala Wiedzmy",
	"Cios w Plecy",
	"Wola Ostrzy",
	"Prawdziwe Uderzenie",
	"Rownowaga"
};

const string StExt_Corruption_Perk_Desc_Mage[StExt_CorruptionPerk_Max] =
{
	"Zabicie czlowieka nagradzane jest +1 do witalnosci.",
	"Gdy mana jest niska, jest uzupelniana witalnoscia.",
	"30% twojej maksymalnej sily zyciowej jest dodawane jako tarcza energii",
	"+1% szansy na trafienie krytyczne zakleciem za kazdy poziom skalania",
	"+2% obrazen magicznych za kazdy poziom profanacji",
	"+2% do mocy przyzwanych stworzen za kazdy poziom profanacji",
	"+0,5% szansy na odbicie zaklecia za kazdy poziom profanacji",
	"+1% regeneracji many na sekunde",
	"Zmniejsza rezerwacje many przez aury o 25%",
	"20% otrzymanych obrazen zostaje przywrocone jako tarcza energii",
	"+1% szansy na powtorne rzucenie zaklecia za kazdy poziom profanacji",
	"10% obrazen zostaje skradzione jako tarcza energii",
	"10% zwiekszenia maksymalnej many",
	"+50% obrazen magicznych przy niskim zdrowiu",
	"Zamiast zdrowia regenerowana jest tarcza energii.",
	"Dodaje 50% twojej maksymalnej many do tarczy energii.",
	"+1% obrazen dla broni magicznej za kazdy poziom profanacji",
	"+10% redukcji kosztu zaklec",
	"+3% do czasu trwania efektow za kazdy poziom profanacji",
	"Gdy sludzy umieraja, eksploduja, zadajac 30% swojego maksymalnego zdrowia jako obrazenia od ognia."
};
const string StExt_Corruption_Perk_Desc_Warrior[StExt_CorruptionPerk_Max] =
{
	"Zabicie czlowieka nagradzane jest +1 do mocy magicznej.",
	"Gdy twoja witalnosc jest niska, jest uzupelniana za pomoca many.",
	"+50 do maksymalnej sily zyciowej za kazdy poziom profanacji",
	"+0,1% regeneracji wytrzymalosci za kazdy poziom profanacji",
	"+5% regeneracji zdrowia przy niskiej witalnosci",
	"+2 do ochrony przed wszystkim za kazdy poziom profanacji",
	"20% otrzymanych obrazen zostaje przywrocone jako zdrowie.",
	"+2% do regeneracji sily zyciowej na sekunde",
	"+2% obrazen w walce wrecz za kazdy poziom profanacji",
	"+1% szansy na podwojne obrazenia za kazdy poziom profanacji",
	"+1 do maksymalnej liczby aktywnych aur",
	"Zmniejszenie rezerwacji zasobow przez aury o 25%",
	"10% zwiekszenia maksymalnego zdrowia",
	"Zabicie wroga w pelni przywraca zdrowie.",
	"+10% odpornosci na wszystkie obrazenia",
	"+0,5% szansy na ogluszenie wroga za kazdy poziom profanacji",
	"+1% obrazen z kuszy za kazdy poziom profanacji",
	"+1% obrazen bronia dwureczna za kazdy poziom profanacji",
	"+1% obrazen bronia jednoreczna za kazdy poziom profanacji",
	"30% twojej sily jest dodawane jako dodatkowa zwinnosc."
};
const string StExt_Corruption_Perk_Desc_Ranger[StExt_CorruptionPerk_Max] =
{
	"Zabicie czlowieka nagradzane jest +1 do witalnosci.",
	"+1% szansy na zyskanie 3 sekund niewidzialnosci za kazdy poziom profanacji",
	"+0,5% szansy na unik za kazdy poziom profanacji",
	"+10 do obrazen klutych za kazdy poziom profanacji",
	"+2% obrazen dystansowych za kazdy poziom profanacji",
	"+1% regeneracji witalnosci na sekunde",
	"+0,1% regeneracji wytrzymalosci za kazdy poziom profanacji",
	"+1% do szybkosci wszystkich dzialan za kazde 2 poziomy profanacji (maks. 50%)",
	"10% otrzymanych obrazen zostaje skradzione jako sila zyciowa i wytrzymalosc",
	"Zadajesz podwojne obrazenia wrogom, ktorzy cie nie widza.",
	"+1% szansy na powtorny strzal za kazdy poziom profanacji",
	"+1% do obrazen zywiolowych, magicznych i trujacych za kazdy poziom profanacji",
	"Odbija 10% otrzymanych obrazen jako obrazenia klute.",
	"Podczas biegu +50% szansy na unik atakow",
	"+5 do obrazen trujacych w walce dystansowej za kazdy poziom skalania",
	"+5 do trwalych obrazen magicznych w walce dystansowej za kazdy poziom profanacji",
	"+1% obrazen rapierami i lekkimi mieczami za kazdy poziom profanacji",
	"+1% obrazen przy walce dwiema broniami za kazdy poziom profanacji",
	"+1% obrazen wloczniami za kazdy poziom profanacji",
	"30% twojej zwinnosci jest dodawane jako dodatkowa sila."
};

const string StExt_Str_Yes = "Tak";
const string StExt_Str_No = "Nie";
const string StExt_Str_Learned_Yes = "Wyuczono";
const string StExt_Str_Learned_No = "Nie wyuczono";
const string StExt_Str_Seconds = "sekunda";
const string StExt_Str_Pts = "jednostki";
const string StExt_Str_EvilBossApears = "Zlo przyszlo na ten swiat...";

// *** Difficulty configs strings ***
const string StExt_Str_Config_Diff_Header = "--- * Ustawienia trudnosci * ---";
const string StExt_Str_Config_Diff_EnableStatic = "Wlacz stale zwiekszenie trudnosci";
const string StExt_Str_Config_Diff_Static_Power = "Stale zwiekszenie mocy NPC";
const string StExt_Str_Config_Diff_Static_Hp = "Stale zwiekszenie zycia NPC";
const string StExt_Str_Config_Diff_Static_Prot = "Stale zwiekszenie obrony NPC";

const string StExt_Str_Config_Diff_EnableDaily = "Wlacz dzienny wzrost trudnosci";
const string StExt_Str_Config_Diff_Daily_Power = "Dzienny wzrost mocy NPC";
const string StExt_Str_Config_Diff_Daily_Hp = "Dzienny wzrost zycia NPC";
const string StExt_Str_Config_Diff_Daily_Prot = "Dzienny wzrost obrony NPC";

const string StExt_Str_Config_Diff_EnableKapitel = "Wlacz wzrost trudnosci wg rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Power = "Wzrost mocy NPC wg rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Hp = "Wzrost zycia NPC wg rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Prot = "Wzrost obrony NPC wg rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Speed = "Wzrost dodatkowej szybkosci NPC wg rozdzialu";

const string StExt_Str_Config_Diff_EnableLevel = "Wlacz wzrost trudnosci zalezny od poziomu bohatera";
const string StExt_Str_Config_Diff_Level_Power = "Wzrost mocy NPC zalezny od poziomu bohatera";
const string StExt_Str_Config_Diff_Level_Hp = "Wzrost zycia NPC zalezny od poziomu bohatera";
const string StExt_Str_Config_Diff_Level_Prot = "Wzrost obrony NPC zalezny od poziomu bohatera";
const string StExt_Str_Config_Diff_Level_Speed = "Wzrost dodatkowej szybkosci NPC (%) zalezny od poziomu bohatera";
const string StExt_Str_Config_Diff_Level_DuplicationChance = "Dodatkowy wzrost szansy na duplikacje NPC zalezny od poziomu bohatera";
const string StExt_Str_Config_Diff_Level_CorruptionChance = "Dodatkowy wzrost szansy skazenia nasycenia magicznego NPC zalezny od poziomu bohatera";
const string StExt_Str_Config_Diff_Level_MagicInfusionChance = "Dodatkowy wzrost szansy magicznego nasycenia NPC zalezny od poziomu bohatera";
const string StExt_Str_Config_Diff_Level_MagicInfusionPower = "Dodatkowy wzrost mocy magicznego nasycenia NPC zalezny od poziomu bohatera";

const string StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Chance = "Dodatkowy wzrost szansy na duplikacje NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_Duplication_Count = "Dodatkowy wzrost liczby duplikowanych NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Chance = "Dodatkowy wzrost szansy magicznego nasycenia NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_Power = "Dodatkowy wzrost mocy magicznego nasycenia NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_CorruptionChance = "Dodatkowy wzrost szansy skazenia nasycenia magicznego NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_MagicInfusion_TierRange = "Przesuniecie rangi magicznego nasycenia NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomMeleeWeapon_Chance = "Dodatkowy wzrost szansy na magiczna bron do walki wrecz u NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomRangeWeapon_Chance = "Dodatkowy wzrost szansy na magiczna bron dystansowa u NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomShield_Chance = "Dodatkowy wzrost szansy na tarcze u NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomHelm_Chance = "Dodatkowy wzrost szansy na helm u NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_RandomScroll_Chance = "Dodatkowy wzrost szansy na zwoj bojowy u NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_Npc_HealingScroll_Chance = "Dodatkowy wzrost szansy na zwoj leczacy u NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_DailyHpMod = "Dodatkowy bonus do dziennego wzrostu zycia NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_DailyPowerMod = "Dodatkowy bonus do dziennego wzrostu mocy NPC od rozdzialu";
const string StExt_Str_Config_Diff_Kapitel_DailyProtMod = "Dodatkowy bonus do dziennego wzrostu obrony NPC od rozdzialu";

const string StExt_Str_Config_Diff_EnableRot = "Wlacz pojawianie sie z 'Drogi Prob'";

// *** Npc configs strings ***
const string StExt_Str_Config_Npc_Header = "--- * Ustawienia NPC * ---";
const string StExt_Str_Config_Npc_EnableStatsRandomization = "Wlacz losowosc statystyk NPC";
const string StExt_Str_Config_Npc_StatsRandomization_Hp = "Losowosc zycia NPC";
const string StExt_Str_Config_Npc_StatsRandomization_Stats = "Losowosc statystyk NPC";
const string StExt_Str_Config_Npc_StatsRandomization_Protection = "Losowosc ochrony NPC";
const string StExt_Str_Config_Npc_StatsRandomization_Damage = "Rozrzut obrazen NPC";

const string StExt_Str_Config_Npc_EnableLevelBonus = "Wlacz bonus z poziomu NPC";
const string StExt_Str_Config_Npc_LevelBonus_Hp = "Dodatkowe HP NPC za poziom";
const string StExt_Str_Config_Npc_LevelBonus_Stats = "Dodatkowe statystyki NPC za poziom";
const string StExt_Str_Config_Npc_LevelBonus_Protection = "Dodatkowa ochrona NPC za poziom";
const string StExt_Str_Config_Npc_LevelBonus_Damage = "Dodatkowe obrazenia NPC za poziom";

const string StExt_Str_Config_Npc_EnableDuplication = "Wlacz duplikacje NPC";
const string StExt_Str_Config_Npc_Duplication_Chance = "Bazowa szansa na duplikacje NPC";
const string StExt_Str_Config_Npc_Duplication_CountMin = "Minimalna liczba duplikowanych NPC";
const string StExt_Str_Config_Npc_Duplication_CountMax = "Maksymalna liczba duplikowanych NPC";
const string StExt_Str_Config_Npc_Duplication_AllowBosses = "Zezwol na duplikacje bossow";
const string StExt_Str_Config_Npc_Duplication_AllowHumans = "Zezwol na duplikacje ludzi";
const string StExt_Str_Config_Npc_Duplication_AllowHumansBandits = "Zezwol na duplikacje bandytow";
const string StExt_Str_Config_Npc_Duplication_LevelThreshold = "Minimalny poziom bohatera do rozpoczecia duplikacji";

const string StExt_Str_Config_Npc_EnableMagicInfusion = "Wlacz magiczne nasycenie NPC";
const string StExt_Str_Config_Npc_MagicInfusion_Chance = "Bazowa szansa magicznego nasycenia NPC";
const string StExt_Str_Config_Npc_MagicInfusion_LevelThreshold = "Minimalny poziom bohatera do rozpoczecia magicznego nasycenia";
const string StExt_Str_Config_Npc_MagicInfusion_PowerMod = "Modyfikator mocy magicznego nasycenia";
const string StExt_Str_Config_Npc_MagicInfusion_AllowHumans = "Zezwol na magiczne nasycenie ludzi";
const string StExt_Str_Config_Npc_MagicInfusion_AllowBosses = "Zezwol na magiczne nasycenie bossow";
const string StExt_Str_Config_Npc_MagicInfusion_CorruptionChance = "Szansa skazenia afiksow NPC";

const string StExt_Str_Config_Npc_EnableRandomEquipment = "Wlacz losowe wyposazenie NPC";
const string StExt_Str_Config_Npc_RandomMeleeWeapon_Chance = "Bazowa szansa na magiczna bron do walki wrecz u NPC";
const string StExt_Str_Config_Npc_RandomRangeWeapon_Chance = "Bazowa szansa na magiczna bron dystansowa u NPC";
const string StExt_Str_Config_Npc_RandomScroll_Chance = "Bazowa szansa na zwoj bojowy u NPC";
const string StExt_Str_Config_Npc_HealingScroll_Chance = "Bazowa szansa na zwoj leczacy u NPC";
const string StExt_Str_Config_Npc_RandomShield_Chance = "Bazowa szansa na tarcze u NPC";
const string StExt_Str_Config_Npc_RandomHelm_Chance = "Bazowa szansa na helm u NPC";

const string StExt_Str_Config_Npc_MagicInfusedAlwaysHasRandomEquipment = "Magicznie nasyceni NPC zawsze otrzymuja bron magiczna";

const string StExt_Str_Config_Npc_LuckyFlagChance = "Szansa na pojawienie sie szczesliwych NPC";
const string StExt_Str_Config_Npc_RichFlagChance = "Szansa na pojawienie sie bogatych NPC";

const string StExt_Str_Config_Npc_GlobalHpMult = "Koncowy modyfikator witalnosci NPC";
const string StExt_Str_Config_Npc_GlobalStatMult = "Koncowy modyfikator cech NPC";
const string StExt_Str_Config_Npc_GlobalProtMult = "Koncowy modyfikator ochrony NPC";
const string StExt_Str_Config_Npc_GlobalDamMult = "Koncowy modyfikator obrazen NPC";
const string StExt_Str_Config_Npc_GlobalEsMult = "Koncowy modyfikator tarczy energii NPC";

const string StExt_Str_Config_NpcSum_CanBeDuplicated = "Przyzwani NPC moga byc duplikowani";
const string StExt_Str_Config_NpcSum_CanBeInfused = "Przyzwani NPC moga byc magicznie nasyceni";
const string StExt_Str_Config_NpcSum_GlobalHpMult = "Koncowy modyfikator witalnosci przyzwanych NPC";
const string StExt_Str_Config_NpcSum_GlobalStatMult = "Koncowy modyfikator cech przyzwanych NPC";
const string StExt_Str_Config_NpcSum_GlobalProtMult = "Koncowy modyfikator ochrony przyzwanych NPC";
const string StExt_Str_Config_NpcSum_GlobalDamMult = "Koncowy modyfikator obrazen przyzwanych NPC";
const string StExt_Str_Config_NpcSum_GlobalEsMult = "Koncowy modyfikator tarczy energii przyzwanych NPC";

const string StExt_Str_Config_Sum_GlobalHpMult = "Koncowy modyfikator witalnosci przyzwanych stworzen";
const string StExt_Str_Config_Sum_GlobalStatMult = "Koncowy modyfikator cech przyzwanych stworzen";
const string StExt_Str_Config_Sum_GlobalProtMult = "Koncowy modyfikator obrony przyzwanych stworzen";
const string StExt_Str_Config_Sum_GlobalDamMult = "Koncowy modyfikator obrazen przyzwanych stworzen";

// *** Luck configs strings ***
const string StExt_Str_Config_Luck_Header = "--- * Ustawienia szczescia * ---";
const string StExt_Str_Config_Luck_Difficulty = "Bazowy modyfikator trudnosci szczescia";
const string StExt_Str_Config_Luck_Power = "Bazowy modyfikator mocy przedmiotow";
const string StExt_Str_Config_Luck_Quantity = "Bazowy modyfikator ilosci przedmiotow";
const string StExt_Str_Config_Luck_Money = "Bazowy modyfikator ilosci zlota";

const string StExt_Str_Config_Luck_EnableRandomLoot_Bodies = "Wlacz szczescie u pokonanych NPC";
const string StExt_Str_Config_Luck_EnableRandomLoot_Chests = "Wlacz szczescie w skrzyniach";
const string StExt_Str_Config_Luck_RandomLoot_EnableUnHumanDrop = "Wlacz szczescie u nieludzkich NPC";

const string StExt_Str_Config_Luck_RandomLootPowerMod_Food = "Modyfikator mocy szczescia dla jedzenia";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Alchemy = "Modyfikator mocy szczescia dla alchemii";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Magic = "Modyfikator mocy szczescia dla magii";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Misk = "Modyfikator mocy szczescia dla roznych przedmiotow";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Armor = "Modyfikator mocy szczescia dla zbroi";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Weapon = "Modyfikator mocy szczescia dla broni";
const string StExt_Str_Config_Luck_RandomLootPowerMod_Jewelry = "Modyfikator mocy szczescia dla bizuterii";

const string StExt_Str_Config_Luck_RandomLootQuantityMod_Food = "Modyfikator ilosci jedzenia";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Alchemy = "Modyfikator ilosci alchemii";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Magic = "Modyfikator ilosci magii";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Munition = "Modyfikator ilosci strzal i beltow";
const string StExt_Str_Config_Luck_RandomLootQuantityMod_Misk = "Modyfikator ilosci roznych przedmiotow";

// *** World randomization configs strings ***
const string StExt_Str_Config_WorldRandomization_Header = "--- * Ustawienia losowosci swiata * ---";
const string StExt_Str_Config_EnableWorldRandomization_Items = "Wlacz losowe pojawianie sie przedmiotow w swiecie";
const string StExt_Str_Config_EnableWorldRandomization_Npc = "Wlacz losowe pojawianie sie NPC w swiecie";
const string StExt_Str_Config_WorldRandomization_MinCooldown = "Minimalny czas odnowienia losowosci swiata";
const string StExt_Str_Config_WorldRandomization_MaxCooldown = "Maksymalny czas odnowienia losowosci swiata";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnChance = "Szansa na pojawienie sie losowych NPC w swiecie";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPowerMod = "Modyfikator mocy losowych NPC";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnCountMod = "Modyfikator liczby pojawiajacych sie losowych NPC";
const string StExt_Str_Config_WorldRandomization_Item_SpawnChance = "Szansa na pojawienie sie losowych przedmiotow w swiecie";
const string StExt_Str_Config_WorldRandomization_Item_SpawnPowerMod = "Modyfikator mocy losowych przedmiotow";
const string StExt_Str_Config_WorldRandomization_Item_SpawnCountMod = "Modyfikator liczby losowych przedmiotow";

const string StExt_Str_Config_WorldRandomization_TradersExtraItemsAddRate = "Czestotliwosc dodawania losowych przedmiotow u handlarzy";
const string StExt_Str_Config_WorldRandomization_EmptyChestsUpdateRate = "Czestotliwosc odnawiania pustych skrzyn";
const string StExt_Str_Config_WorldRandomization_Npc_EnableSpawnSound = "Wlacz powiadomienie dzwiekowe przy pojawieniu sie NPC przez randomizator";

// *** Other configs strings ***
const string StExt_Str_Config_Misk_Header = "--- * Pozostale ustawienia * ---";
const string StExt_Str_Config_EnableSkeletonSkin = "Wlacz skore nieumarlego";
const string StExt_Str_Config_EnableSkeletonSkin_OnlyAtNight = "Skora nieumarlego jest aktywna tylko w nocy";
const string StExt_Str_Config_EnableFemaleLook = "Wlacz skore zenska";
const string StExt_Str_Config_EnableFemaleLook_AlwaysWig = "Wlacz skore zenska - peruka";
const string StExt_Str_Config_EnableFemaleLook_HideHelm = "Zamien helm na peruke (skora zenska)";
const string StExt_Str_Config_EnableFemaleLook_DemonLook = "Skora zenska - wyglad demona";

const string StExt_Str_Config_GainExpMod = "Modyfikator zdobywanego doswiadczenia";
const string StExt_Str_Config_ExpMod = "Ogolny modyfikator zdobywanego doswiadczenia (ustawienie z oryginalu)";
const string StExt_Str_Config_SncExp = "Bezwzgledny modyfikator rozwoju SNC";
const string StExt_Str_Config_PartyExp = "Doswiadczenie zdobywane z sojusznikami";
const string StExt_Str_Config_NpcExp = "Doswiadczenie zdobywane od NPC";
const string StExt_Str_Config_BelliarRageExp = "Modyfikator doswiadczenia zdobywanego od wrogow (Gniew Beliara)";

const string StExt_Str_Config_BelliarRage_Active = "Gniew Beliara - mod aktywny";
const string StExt_Str_Config_BelliarRage_SpawnMonsters = "Gniew Beliara - losowe pojawianie sie potworow przy bohaterze";
const string StExt_Str_Config_BelliarRage_StaminaReduce = "Gniew Beliara - zwiekszenie wymagan wytrzymalosci";
const string StExt_Str_Config_BelliarRage_AddDamageReduce = "Gniew Beliara - redukcja wszystkich dodatkowych obrazen";
const string StExt_Str_Config_BelliarRage_RegenEnemies = "Gniew Beliara - regeneracja zdrowia u wrogow";
const string StExt_Str_Config_BelliarRage_SoundEnable = "Gniew Beliara - wlacz dzwiek";

const string StExt_Str_Config_ExtraLp = "Dodatkowe punkty nauki za poziom";
const string StExt_Str_Config_ExtraHpPerLevel = "Dodatkowe punkty zycia za poziom";
const string StExt_Str_Config_ExtraMpPerLevel = "Dodatkowa mana za poziom";
const string StExt_Str_Config_ExtraEsPerLevel = "Dodatkowa tarcza energii za poziom";
const string StExt_Str_Config_ExtraStrPerLevel = "Dodatkowa sila za poziom";
const string StExt_Str_Config_ExtraAgiPerLevel = "Dodatkowa zrecznosc za poziom";
const string StExt_Str_Config_ExtraIntPerLevel = "Dodatkowa inteligencja za poziom";
const string StExt_Str_Config_ExtraLuckPerLevel = "Dodatkowe szczescie za poziom";

const string StExt_Str_Config_MasteriesExpMult = "Modyfikator doswiadczenia mistrzostwa";
const string StExt_Str_Config_CorruptionExpMult = "Modyfikator doswiadczenia skazenia";
const string StExt_Str_Config_ArtifactsExpMult = "Modyfikator doswiadczenia artefaktow";
const string StExt_Str_Config_EducationMoneyCostMult = "Modyfikator zlota za trening umiejetnosci";
const string StExt_Str_Config_EducationRequirementsMult = "Modyfikator wymagan treningu umiejetnosci";
const string StExt_Str_Config_NoChapterForMagicCircle = "Wylacz wymagania rozdzialu dla treningu kregu magicznego";
const string StExt_Str_Config_ShowNpcLevel = "Pokaz poziom NPC";
const string StExt_Str_Config_DisplayLuckMessage = "Wyswietlaj wiadomosci o szczesciu";
const string StExt_Str_Config_DisplayMasteryLevelUp = "Wyswietlaj wiadomosci o rozwoju mistrzostwa";
const string StExt_Str_Configs_Education = "[Naucz sie specjalnych umiejetnosci]";

const string StExt_Str_Config_Ui_Header = "--- * Ustawienia interfejsu * ---";
const string StExt_Str_Config_MenuScaleX = "Szerokosc menu (mod)";
const string StExt_Str_Config_MenuScaleY = "Wysokosc menu (mod)";
const string StExt_Str_Config_DisplayBuffEffects = "Wyswietlaj efekty wzmocnien/oslabien";
const string StExt_Str_Config_DisplayEsEffects = "Wyswietlaj efekt tarczy energii";
const string StExt_Str_Config_MenuTextWrapIndex = "Indeks zawijania tekstu w menu";
const string StExt_Str_GeneralPerks_Header = "Umiejetnosci Ogolne";

/* *** Aura strings *** */
const string StExt_Str_AuraName[StExt_AuraIndex_Max] =
{
	"Koncentrator",
	"Serce Bizona",
	"Madrosc Adanosa",
	"Tajemna Wiedza",
	"Moc Niedzwiedzia",
	"Zwinnosc Pumy",
	"Sowia Nora",
	"Regeneracja Wilka",
	"Spryt Kruka",
	"Wytrzymalosc Psa",
	"Sen Marzyciela",
	"Szybkosc Geparda",
	"Astralny Strumien",
	"Zwinnosc Weza",
	"Pijawka",
	"Illithid",
	"Zlodziej Dusz",
	"Zelazna Skora",
	"Tarcza Powietrza",
	"Pozeracz Zaklec",
	"Szczescie",
	"Bogactwo",
	"Zlodziej",
	"Wiedzma",
	"Cmentarz",
	"Lesna Gestwina",
	"Dzien Sadu",
	"Bastion",
	"Ciern",
	"Lustrzana Tarcza",
	"Przyzywacz",
	"Wladca",
	"Asertywny",
	"Inkwizytor",
	"Dotyk Polnocy",
	"Modlitwa",
	"Sluga Smierci",
	"Truciciel",
	"Ladunek",
	"Przeklenstwo",
	"Miazdzyciel",
	"Drwal",
	"Nabijajacy na Pal",
	"Trans Wojownika",
	"Trans Strzaly",
	"Trans Czarnoksieznika",
	"Eteryczna Skora",
	"Wzmocnienie",
	"Zaslona Smierci",
	"Nieswiety Plaszcz",
	"Lodowy Plaszcz",
	"Plaszcz Burzy",
	"Trujacy Plaszcz",
	"Plaszcz Cierni",
	"Ognisty Plaszcz",
	"Kamienny Plaszcz",
	"Plaszcz Gotowosci",
	"Szalejacy Plomien",
	"Lodowy Bolid",
	"Pelzajacy Mrok",
	"Tchnienie Wiecznosci",
	"Dlon Burzy",
	"Wiatr Zmian",
	"Spojrzenie Bazyliszka",
	"Kamien Milowy Potkniecia",
	"Cien Pomocnik",
	"Rozszerzenie",
	"Wladca Astralu",
	"Wladca Umarlych",
	"Wladca Golemow",
	"Wladca Demonow",
	"Wladca Smierci",
	"Wladca Zycia",
	"Wladca Swiatla",
	"Wladca Mroku",
	"Wladca Piorunow",
	"Wladca Powietrza",
	"Wladca Ziemi",
	"Wladca Lodu",
	"Wladca Ognia",
	"Natchnienie Wojownika",
	"Natchnienie Najemnika",
	"Natchnienie Lowcy",
	"Natchnienie Strzelca",
	"Zywa Bron",
	"Natchnienie Skrytobojcy",
	"Zemsta Bulawy",
	"Zemsta Ostrza",
	"Zemsta Luku",
	"Zemsta Ognia",
	"Zemsta Wiatru",
	"Zemsta Magii",
	"Zemsta Trucizny"
};

const string StExt_Str_AuraDesc[StExt_AuraIndex_Max] =
{
	"+200 do mocy aury",
	"+5 do witalnosci za kazdy punkt mocy aury",
	"+2 do mocy magicznej za kazdy punkt mocy aury",
	"+1 do inteligencji za kazdy punkt mocy aury",
	"+1 do sily za kazdy punkt mocy aury",
	"+1 do zrecznosci za kazdy punkt mocy aury",
	"+5 do tarczy energii za kazdy punkt mocy aury",
	"+0,1% regeneracji zdrowia za kazde 10 punktow mocy aury",
	"+0,1% regeneracji tarczy energii za kazde 10 punktow mocy aury",
	"+0,1% regeneracji wytrzymalosci za kazde 5 punktow mocy aury",
	"+0,1% regeneracji many za kazde 10 punktow mocy aury",
	"+1% szybkosci dzialania za kazde 20 punktow mocy aury",
	"+1 do mocy magicznej za kazde 10 jednostek mocy aury",
	"+0,25% szansy na unik trafienia za kazde 10 punktow mocy aury",
	"+0,1% kradziezy zycia za kazde 10 punktow mocy aury",
	"+0,1% kradziezy many za kazde 10 punktow mocy aury",
	"+0,1% kradziezy tarczy za kazde 10 punktow mocy aury",
	"+1 do obrony fizycznej za kazde 2 jednostki mocy aury",
	"0,5% szansy na odbicie strzaly za kazde 10 punktow mocy aury",
	"0,5% pochlaniania zaklec za kazde 10 punktow mocy aury",
	"+0,5% szczescia za kazde 10 jednostek mocy aury",
	"+1% bonusu do znajdowanego zlota za kazde 10 punktow mocy aury",
	"+1% szansy kradziezy za kazde 10 punktow mocy aury",
	"+0,1% szansy na zamiane zabitego wroga w szkieleta za kazde 10 punktow mocy aury",
	"Przyzywa jednego zombie straznika, gdy aura jest aktywna. Zombie rowniez korzysta z mocy aury.",
	"Przyzywa jednego wilka straznika, plus 1 kolejnego za kazde 200 punktow mocy aury. Wilki rowniez korzystaja z mocy aury.",
	"Przyzywa jednego demona straznika, gdy aura jest aktywna. Demon rowniez korzysta z mocy aury.",
	"Przyzywa jednego golema straznika, gdy aura jest aktywna. Golem rowniez korzysta z mocy aury.",
	"+0,1% szansy na odbicie obrazen za kazdy punkt mocy aury",
	"+0,1% szansy na odbicie magii za kazdy punkt mocy aury",
	"+0,1% do calkowitej mocy przyzwanych stworzen za kazdy punkt mocy aury",
	"+1 do maksymalnej liczby przyzwanych stworzen za kazde 100 punktow mocy aury",
	"+0,1% szansy na ogluszenie wroga za kazdy punkt mocy aury",
	"+1 do obrazen od podpalenia za kazdy punkt mocy aury",
	"+0,1% szansy na zamrozenie wroga i zadanie 1 obrazenia za kazdy punkt mocy aury",
	"Nieumarli i zli w niewielkim promieniu otrzymuja 1 obrazenie od ognia za kazdy punkt mocy aury.",
	"+1 do obrazen magicznych przeciw zywym celom za kazdy punkt mocy aury",
	"+1 do obrazen trujacych (dot) za kazdy punkt mocy aury",
	"+0,1% szansy na ogluszenie wroga i zadanie 1 obrazenia za kazdy punkt mocy aury",
	"+1 do obrazen DoT za kazdy punkt mocy aury",
	"+1 do obrazen obuchowych (dot) za kazdy punkt mocy aury",
	"+1 do obrazen siecznych (dot) za kazdy punkt mocy aury",
	"+1 do obrazen klutych (dot) za kazdy punkt mocy aury",
	"+0,1% obrazen bronia do walki wrecz za kazdy punkt mocy aury",
	"+0,1% obrazen bronia dystansowa za kazdy punkt mocy aury",
	"+0,1% obrazen magicznych za kazdy punkt mocy aury",
	"+1 do odpornosci na ogien i magie za kazde 2 punkty mocy aury",
	"+1 do ochrony przed odrzutem za kazdy punkt mocy aury",
	"10% bazowej szansy na wywolanie Mgly Smierci, zadaje 2 obrazenia za kazdy punkt mocy aury.",
	"10% bazowej szansy na wywolanie Fali Mroku, zadajacej 1 obrazenie DoT za kazdy punkt mocy aury.",
	"10% bazowej szansy na wywolanie Fali Chlodu, zadajacej 1 obrazenie za kazdy punkt mocy aury i mogacej zamrozic wrogow.",
	"10% bazowej szansy na wywolanie Fali Elektrycznej, zadajacej 1 obrazenie za kazdy punkt mocy aury i mogacej ogluszyc wrogow.",
	"10% bazowej szansy na wywolanie Fali Trucizny, zadajacej 1 obrazenie trujace za kazdy punkt mocy aury.",
	"10% bazowej szansy na wywolanie Fali Korzeni, zadajacej 1 obrazenie trujace za kazdy punkt mocy aury i oplatujacej wrogow korzeniami.",
	"10% bazowej szansy na wywolanie Fali Ognia, zadajacej 2 obrazenia za kazdy punkt mocy aury.",
	"10% bazowej szansy na wywolanie Trzesienia Ziemi, zadaje 1 obrazenie za kazdy punkt mocy aury i moze ogluszyc wrogow.",
	"10% bazowej szansy na zyskanie chwilowej nietykalnosci przy otrzymaniu obrazen, szansa i czas trwania zaleza od mocy aury.",
	"Wystrzeliwuje Kule Ognia w strone wroga co sekunde.",
	"Wystrzeliwuje Lodowa Wlocznie w strone wroga co sekunde.",
	"Wystrzeliwuje Kule Mroku w strone wroga co sekunde.",
	"Wystrzeliwuje Kule Smierci w strone wroga co sekunde.",
	"Wystrzeliwuje Piorun w strone wroga co sekunde.",
	"Wystrzeliwuje Piesc Powietrza w strone wroga co sekunde.",
	"Wystrzeliwuje Zatruta Strzale w strone wroga co sekunde.",
	"Wystrzeliwuje Kamienna Strzale w strone wroga co sekunde.",
	"Przyzywa cien, kopie ciebie, posiadajaca twoje zdolnosci. Cien rowniez zyskuje bonusy z mocy twojej aury i poziomu bohatera.",
	"+0,1% do czasu trwania efektu za kazdy punkt mocy aury",
	"+1 do mocy magii ducha za kazdy punkt mocy aury",
	"+1 do mocy nekromancji za kazdy punkt mocy aury",
	"+1 do mocy tworzenia golemow za kazdy punkt mocy aury",
	"+1 do mocy demonologii za kazdy punkt mocy aury",
	"+1 do mocy magii smierci za kazdy punkt mocy aury",
	"+1 do mocy magii zycia za kazdy punkt mocy aury",
	"+1 do mocy jasnej magii za kazdy punkt mocy aury",
	"+1 do mocy mrocznej magii za kazdy punkt mocy aury",
	"+1 do mocy elektromancji za kazdy punkt mocy aury",
	"+1 do mocy aeromancji za kazdy punkt mocy aury",
	"+1 do mocy geomancji za kazdy punkt mocy aury",
	"+1 do mocy hydromancji za kazdy punkt mocy aury",
	"+1 do mocy pirokinetyki za kazdy punkt mocy aury",
	"+3 obrazen bronia jednoreczna za kazdy punkt mocy aury",
	"+3 obrazen bronia dwureczna za kazdy punkt mocy aury",
	"+3 obrazen z luku za kazdy punkt mocy aury",
	"+3 obrazen z kuszy za kazdy punkt mocy aury",
	"Rzuca aktualna bronia do walki wrecz w pobliskich wrogow.",
	"+3 obrazen przy walce dwiema broniami za kazdy punkt mocy aury",
	"+5 do zwracanych obrazen miazdzacych za kazdy punkt mocy aury",
	"+5 do zwracanych obrazen siecznych za kazdy punkt mocy aury",
	"+5 do zwracanych obrazen klutych za kazdy punkt mocy aury",
	"+5 do zwracanych obrazen od ognia za kazdy punkt mocy aury",
	"+5 do zwracanych obrazen odrzutu za kazdy punkt mocy aury",
	"+5 do zwracanych obrazen magicznych za kazdy punkt mocy aury",
	"+5 do zwracanych obrazen trujacych za kazdy punkt mocy aury"
};

const string StExt_Str_AuraRequirements[StExt_AuraIndex_Max] =
{
	"Wymaga: 300 Wytrzymalosci",
	"Wymaga: 200 Wytrzymalosci",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 200 Inteligencji",
	"Wymaga: 200 Wytrzymalosci | 100 Sily",
	"Wymaga: 200 Wytrzymalosci | 100 Zrecznosci",
	"Wymaga: 200 Inteligencji",
	"Wymaga: 200 Wytrzymalosci",
	"Wymaga: 200 Inteligencji",
	"Wymaga: 150 Wytrzymalosci",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 250 Wytrzymalosci | 75 Zrecznosci",
	"Wymaga: 250 Inteligencji",
	"Wymaga: 200 Wytrzymalosci | 100 Zrecznosci",
	"Wymaga: 500 Witalnosci",
	"Wymaga: 500 Many",
	"Wymaga: 500 Tarczy Energii",
	"Wymaga: 500 Witalnosci",
	"Wymaga: 300 Witalnosci",
	"Wymaga: 200 Inteligencji | 500 Many",
	"Wymaga: ",
	"Wymaga: ",
	"Wymaga: 50 Zrecznosci",
	"Wymaga: 250 Inteligencji | 600 Many",
	"Wymaga: 300 Inteligencji",
	"Wymaga: 300 Inteligencji",
	"Wymaga: 500 Inteligencji",
	"Wymaga: 400 Inteligencji",
	"Wymaga: 300 Wytrzymalosci",
	"Wymaga: 300 Inteligencji | 500 Many",
	"Wymaga: 200 Inteligencji",
	"Wymaga: 350 Inteligencji | 500 Many",
	"Wymaga: 150 Sily | 300 Wytrzymalosci",
	"Wymaga: 200 Many",
	"Wymaga: 200 Many",
	"Wymaga: 350 Many",
	"Wymaga: 250 Wytrzymalosci",
	"Wymaga: 250 Wytrzymalosci",
	"Wymaga: 250 Many",
	"Wymaga: 250 Many",
	"Wymaga: 300 Wytrzymalosci",
	"Wymaga: 300 Wytrzymalosci",
	"Wymaga: 300 Wytrzymalosci",
	"Wymaga: 300 Wytrzymalosci",
	"Wymaga: 300 Wytrzymalosci",
	"Wymaga: 300 Many",
	"Wymaga: 500 Many",
	"Wymaga: 300 Wytrzymalosci | 500 Witalnosci",
	"Wymaga: 400 Inteligencji | 600 Many",
	"Wymaga: 400 Inteligencji | 600 Many",
	"Wymaga: 400 Inteligencji | 600 Many",
	"Wymaga: 400 Inteligencji | 600 Many",
	"Wymaga: 400 Inteligencji | 600 Many",
	"Wymaga: 400 Inteligencji | 600 Many",
	"Wymaga: 400 Inteligencji | 600 Many",
	"Wymaga: 400 Inteligencji | 600 Many",
	"Wymaga: 500 Wytrzymalosci | 1000 Witalnosci",
	"Wymaga: 100 Inteligencji | 200 Many",
	"Wymaga: 100 Inteligencji | 200 Many",
	"Wymaga: 100 Inteligencji | 200 Many",
	"Wymaga: 100 Inteligencji | 200 Many",
	"Wymaga: 100 Inteligencji | 200 Many",
	"Wymaga: 100 Inteligencji | 200 Many",
	"Wymaga: 100 Inteligencji | 200 Many",
	"Wymaga: 100 Inteligencji | 200 Many",
	"Wymaga: 500 Witalnosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Inteligencji",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 300 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci",
	"Wymaga: 100 Wytrzymalosci"
};

const string StExt_Str_AuraReservation[StExt_AuraIndex_Max] =
{
	"Rezerwuje: 10% Wytrzymalosci",
	"Rezerwuje: 15% Wytrzymalosci",
	"Rezerwuje: 25% Wytrzymalosci",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 15% Wytrzymalosci",
	"Rezerwuje: 15% Wytrzymalosci",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 25% Wytrzymalosci",
	"Rezerwuje: 25% Many",
	"Rezerwuje: 10% Wytrzymalosci",
	"Rezerwuje: 15% Many",
	"Rezerwuje: 35% Wytrzymalosci",
	"Rezerwuje: 40% Many",
	"Rezerwuje: 35% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 15% Tarczy Energii",
	"Rezerwuje: 25% Wytrzymalosci",
	"Rezerwuje: 35% Wytrzymalosci",
	"Rezerwuje: 35% Many",
	"Rezerwuje: 15% Wytrzymalosci",
	"Rezerwuje: 15% Wytrzymalosci",
	"Rezerwuje: 5% Wytrzymalosci",
	"Rezerwuje: 35% Many",
	"Rezerwuje: 35% Many",
	"Rezerwuje: 35% Many",
	"Rezerwuje: 40% Many",
	"Rezerwuje: 40% Many",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 25% Many",
	"Rezerwuje: 60% Many",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 25% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 15% Wytrzymalosci",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 25% Wytrzymalosci",
	"Rezerwuje: 25% Wytrzymalosci",
	"Rezerwuje: 25% Many",
	"Rezerwuje: 25% Many",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Many",
	"Rezerwuje: 30% Wytrzymalosci",
	"Rezerwuje: 50% Many",
	"Rezerwuje: 50% Many",
	"Rezerwuje: 50% Many",
	"Rezerwuje: 50% Many",
	"Rezerwuje: 50% Many",
	"Rezerwuje: 50% Many",
	"Rezerwuje: 50% Many",
	"Rezerwuje: 50% Many",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 15% Wytrzymalosci",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Many",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 35% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci",
	"Rezerwuje: 20% Wytrzymalosci"
};

const string StExt_Str_NotEnoughtLpMessagePart = "Punkty Nauki!";
const string StExt_Str_Auras_NoSlot = "Osiagnieto limit liczby aktywnych aur!";
const string StExt_Str_Auras_NoMana = "Wymagania aury przekraczaja ludzkie mozliwosci!";
const string StExt_Str_Auras_NoStats = "Nie spelniono wymagan aury!";
const string StExt_Str_Auras_CantEquip = "Nie mozna aktywowac aury!";
const string StExt_Str_print_Aura = "Aura: ";
const string StExt_Str_DisplayManaReq = "Wymagana mana: ";
const string StExt_Str_DisplayStrReq = "Wymagana sila: ";
const string StExt_Str_DisplayAgiReq = "Wymagana zrecznosc: ";
const string StExt_Str_DisplayHpReq = "Wymagane zycie: ";
const string StExt_Str_DisplayStamReq = "Wymagana wytrzymalosc: ";
const string StExt_Str_DisplayBowReq = "Wymagana umiejetnosc luku: ";
const string StExt_Str_DisplayCBowReq = "Wymagana umiejetnosc kuszy: ";
const string StExt_Str_DisplayShieldReq = "Wymagana umiejetnosc tarczy: ";
const string StExt_Str_DisplayShieldProtWeap = "Ochrona broni: ";
const string StExt_Str_DisplayShieldProtPoint = "Ochrona przed strzalami: ";
const string StExt_Str_PotionEffect_Header = "Efekty mikstury:";

const string StExt_Str_CorruptionScrollName = "Zwoj Tajemniczego Rytualu";
const string StExt_Str_CorruptionScrollTxt1 = "Opisano tu bardzo mroczny rytual zdobywania szczegolnych mocy...";
const string StExt_Str_CorruptionScrollTxt2 = "Moze lepiej zostawic ten zwoj w spokoju?";
const string StExt_Str_CorruptionScrollTxt3 = "Dziala tylko na oslabione cele (do 15 poziomu)";

/* *** Books strings *** */
const string itwr_StExt_book_ice1_name = "Grymuar Hydromancji - Uczen";
const string itwr_StExt_book_ice2_name = "Grymuar Hydromancji - Adept";
const string itwr_StExt_book_ice3_name = "Grymuar Hydromancji - Ekspert";
const string itwr_StExt_book_ice4_name = "Grymuar Hydromancji - Mistrz";
const string itwr_StExt_book_ice5_name = "Grymuar Hydromancji - Wielki Mistrz";

const string itwr_StExt_book_electro1_name = "Grymuar Elektromancji - Uczen";
const string itwr_StExt_book_electro2_name = "Grymuar Elektromancji - Adept";
const string itwr_StExt_book_electro3_name = "Grymuar Elektromancji - Ekspert";
const string itwr_StExt_book_electro4_name = "Grymuar Elektromancji - Mistrz";
const string itwr_StExt_book_electro5_name = "Grymuar Elektromancji - Wielki Mistrz";

const string itwr_StExt_book_dark1_name = "Grymuar Mrocznej Magii - Uczen";
const string itwr_StExt_book_dark2_name = "Grymuar Mrocznej Magii - Adept";
const string itwr_StExt_book_dark3_name = "Grymuar Mrocznej Magii - Ekspert";
const string itwr_StExt_book_dark4_name = "Grymuar Mrocznej Magii - Mistrz";
const string itwr_StExt_book_dark5_name = "Grymuar Mrocznej Magii - Wielki Mistrz";

const string itwr_StExt_book_fire1_name = "Grymuar Pirokinetyki - Uczen";
const string itwr_StExt_book_fire2_name = "Grymuar Pirokinetyki - Adept";
const string itwr_StExt_book_fire3_name = "Grymuar Pirokinetyki - Ekspert";
const string itwr_StExt_book_fire4_name = "Grymuar Pirokinetyki - Mistrz";
const string itwr_StExt_book_fire5_name = "Grymuar Pirokinetyki - Wielki Mistrz";

const string itwr_StExt_book_air1_name = "Grymuar Aeromancji - Uczen";
const string itwr_StExt_book_air2_name = "Grymuar Aeromancji - Adept";
const string itwr_StExt_book_air3_name = "Grymuar Aeromancji - Ekspert";
const string itwr_StExt_book_air4_name = "Grymuar Aeromancji - Mistrz";
const string itwr_StExt_book_air5_name = "Grymuar Aeromancji - Wielki Mistrz";

const string itwr_StExt_book_earth1_name = "Grymuar Geomancji - Uczen";
const string itwr_StExt_book_earth2_name = "Grymuar Geomancji - Adept";
const string itwr_StExt_book_earth3_name = "Grymuar Geomancji - Ekspert";
const string itwr_StExt_book_earth4_name = "Grymuar Geomancji - Mistrz";
const string itwr_StExt_book_earth5_name = "Grymuar Geomancji - Wielki Mistrz";

const string itwr_StExt_book_light1_name = "Grymuar Jasnej Magii - Uczen";
const string itwr_StExt_book_light2_name = "Grymuar Jasnej Magii - Adept";
const string itwr_StExt_book_light3_name = "Grymuar Jasnej Magii - Ekspert";
const string itwr_StExt_book_light4_name = "Grymuar Jasnej Magii - Mistrz";
const string itwr_StExt_book_light5_name = "Grymuar Jasnej Magii - Wielki Mistrz";

const string itwr_StExt_book_golems1_name = "Grymuar Tworzenia Golemow - Uczen";
const string itwr_StExt_book_golems2_name = "Grymuar Tworzenia Golemow - Adept";
const string itwr_StExt_book_golems3_name = "Grymuar Tworzenia Golemow - Ekspert";
const string itwr_StExt_book_golems4_name = "Grymuar Tworzenia Golemow - Mistrz";
const string itwr_StExt_book_golems5_name = "Grymuar Tworzenia Golemow - Wielki Mistrz";

const string itwr_StExt_book_necromancy1_name = "Grymuar Nekromancji - Uczen";
const string itwr_StExt_book_necromancy2_name = "Grymuar Nekromancji - Adept";
const string itwr_StExt_book_necromancy3_name = "Grymuar Nekromancji - Ekspert";
const string itwr_StExt_book_necromancy4_name = "Grymuar Nekromancji - Mistrz";
const string itwr_StExt_book_necromancy5_name = "Grymuar Nekromancji - Wielki Mistrz";

const string itwr_StExt_book_healing1_name = "Grymuar Magii Zycia - Uczen";
const string itwr_StExt_book_healing2_name = "Grymuar Magii Zycia - Adept";
const string itwr_StExt_book_healing3_name = "Grymuar Magii Zycia - Ekspert";
const string itwr_StExt_book_healing4_name = "Grymuar Magii Zycia - Mistrz";
const string itwr_StExt_book_healing5_name = "Grymuar Magii Zycia - Wielki Mistrz";

const string itwr_StExt_book_demonolog1_name = "Grymuar Demonologii - Uczen";
const string itwr_StExt_book_demonolog2_name = "Grymuar Demonologii - Adept";
const string itwr_StExt_book_demonolog3_name = "Grymuar Demonologii - Ekspert";
const string itwr_StExt_book_demonolog4_name = "Grymuar Demonologii - Mistrz";
const string itwr_StExt_book_demonolog5_name = "Grymuar Demonologii - Wielki Mistrz";

const string itwr_StExt_book_death1_name = "Grymuar Magii Smierci - Uczen";
const string itwr_StExt_book_death2_name = "Grymuar Magii Smierci - Adept";
const string itwr_StExt_book_death3_name = "Grymuar Magii Smierci - Ekspert";
const string itwr_StExt_book_death4_name = "Grymuar Magii Smierci - Mistrz";
const string itwr_StExt_book_death5_name = "Grymuar Magii Smierci - Wielki Mistrz";

const string itwr_StExt_book_shaman1_name = "Grymuar Magii Ducha - Uczen";
const string itwr_StExt_book_shaman2_name = "Grymuar Magii Ducha - Adept";
const string itwr_StExt_book_shaman3_name = "Grymuar Magii Ducha - Ekspert";
const string itwr_StExt_book_shaman4_name = "Grymuar Magii Ducha - Mistrz";
const string itwr_StExt_book_shaman5_name = "Grymuar Magii Ducha - Wielki Mistrz";

const string itwr_StExt_book_matrialarts1_name = "Sztuka Wojny - Uczen";
const string itwr_StExt_book_matrialarts2_name = "Sztuka Wojny - Adept";
const string itwr_StExt_book_matrialarts3_name = "Sztuka Wojny - Ekspert";
const string itwr_StExt_book_matrialarts4_name = "Sztuka Wojny - Mistrz";
const string itwr_StExt_book_matrialarts5_name = "Sztuka Wojny - Wielki Mistrz";

const string itwr_StExt_book_agile1_name = "Sztuka Obrony - Uczen";
const string itwr_StExt_book_agile2_name = "Sztuka Obrony - Adept";
const string itwr_StExt_book_agile3_name = "Sztuka Obrony - Ekspert";
const string itwr_StExt_book_agile4_name = "Sztuka Obrony - Mistrz";
const string itwr_StExt_book_agile5_name = "Sztuka Obrony - Wielki Mistrz";

const string itwr_StExt_book_archery1_name = "Sztuka Lucznictwa - Uczen";
const string itwr_StExt_book_archery2_name = "Sztuka Lucznictwa - Adept";
const string itwr_StExt_book_archery3_name = "Sztuka Lucznictwa - Ekspert";
const string itwr_StExt_book_archery4_name = "Sztuka Lucznictwa - Mistrz";
const string itwr_StExt_book_archery5_name = "Sztuka Lucznictwa - Wielki Mistrz";

const string StExt_Str_ImpossibleToReadMasteryBook = "Nie mozna przeczytac - nie spelniono wymagan!";

/* *** Food strings *** */
const string StExt_Str_BoozeDesc = "Rzadki i elitarny zamorski trunek...";
const string StExt_Str_BoozeCiderName = "Cydr";
const string StExt_Str_BoozeMeadName = "Miod Pitny";
const string StExt_Str_BoozeVodkaName = "Wodka";
const string StExt_Str_BoozeWhiskeyName = "Whisky";
const string StExt_Str_BoozeCognacName = "Koniak";
const string StExt_Str_BoozeBrendyName = "Brandy";
const string StExt_Str_BoozeAbsinthName = "Absynt";
const string StExt_Str_BoozeTequilaName = "Tequila";
const string StExt_Str_BoozeScotchName = "Szkocka Whisky";
const string StExt_Str_BoozeGrappaName = "Grappa";
const string StExt_Str_FruitsDesc = "Rzadki zamorski owoc. Dobry na zdrowie...";
const string StExt_Str_PineAppleName = "Ananas";
const string StExt_Str_PearName = "Gruszka";
const string StExt_Str_CocountName = "Kokos";
const string StExt_Str_BananaName = "Banan";

const string StExt_Str_BluntName = "Tepy";
const string StExt_Str_BluntDesc1 = "Wypelnione najwyborniejsza bagienna trawa!";
const string StExt_Str_BluntDesc2 = "Zmniejsza zmeczenie. Zwieksza pragnienie i glod.";
const string StExt_Str_BluntDesc3 = "Wywoluje niezwykle doznania...";

const string StExt_Str_StonedWax_Name = "Flakon Magicznego Atramentu";
const string StExt_Str_StonedWax_Desc = "Kliknij, by uzyc i tworzyc magiczne zwoje";

const string StExt_Str_Grimmoire_Name = "Bezimienny Grymuar";
const string StExt_Str_Dagger_Name = "Bezimienny Sztylet";
const string StExt_Str_Grimmoire_Txt = "Bezcenny magiczny grymuar...";
const string StExt_Str_Dagger_Txt = "Bezcenny magiczny sztylet...";
const string StExt_Str_Artifact_Txt = "Unikalny artefakt, ktory rozwija sie wraz z wlascicielem";

const string StExt_StonePlateDia_Mana = "Starozytna Tablica Arcykaplana";
const string StExt_StonePlateDia_ManaMax = "Starozytna Tablica Arcykaplana";
const string StExt_StonePlateDia_Hp = "Starozytna Tablica Starszego Uzdrowiciela";
const string StExt_StonePlateDia_HpMax = "Starozytna Tablica Najwyzszego Uzdrowiciela";
const string StExt_StonePlateDia_Str = "Starozytna Kamienna Plyta Starszego Wojownika";
const string StExt_StonePlateDia_StrMax = "Starozytna Tablica Poteznego Wojownika";
const string StExt_StonePlateDia_Agi = "Starozytna Kamienna Plyta Starszego Lowcy";
const string StExt_StonePlateDia_AgiMax = "Starozytna Tablica Poteznego Lowcy";	
const string StExt_StonePlateDia_1h = "Starozytna Tablica Starszego Szermierza";
const string StExt_StonePlateDia_1hMax = "Starozytna Tablica Poteznego Szermierza";
const string StExt_StonePlateDia_2h = "Starozytna Tablica Starszego Wlocznika";
const string StExt_StonePlateDia_2hMax = "Starozytna Tablica Poteznego Wlocznika";
const string StExt_StonePlateDia_Bow = "Starozytna Kamienna Plyta Starszego Lucznika";
const string StExt_StonePlateDia_BowMax = "Starozytna Tablica Poteznego Lucznika";
const string StExt_StonePlateDia_CrsBow = "Starozytna Tablica Starszego Kusznika";
const string StExt_StonePlateDia_CrsBowMax = "Starozytna Tablica Poteznego Kusznika";

const string Stext_Itam_Luckycharm_Name = "Szczesliwy Amulet";
const string Stext_Itam_Luckycharm_Txt = "Bonus do szczescia:";
const string Stext_Str_Buyrobe = "Kup poczatkujaca szate maga (1500 zlota)";
const string Itar_Stext_Mage_Novise_Name = "Szata Maga Nowicjusza";
const string Itar_Stext_Mage_Novise_Txt1 = "Obrona przed cieciem: 15";
const string Itar_Stext_Mage_Novise_Txt2 = "Ochrona przed miazdzeniem: 10";
const string Itar_Stext_Mage_Novise_Txt3 = "Ochrona przed przebiciem: 5";
const string Itar_Stext_Mage_Novise_Txt4 = "Ochrona przed magia: 15 | ochrona przed ogniem: 10";

const string Itrw_Stext_Str_Starting_Crossbow = "Najprostsza wysluzona kusza";
const string Itrw_Stext_Str_Starting_Bow = "Najprostszy zgnily luk refleksyjny";
const string Itmw_Stext_Str_Starting_1h_Sword = "Najprostszy zardzewialy miecz";
const string Itmw_Stext_Str_Starting_2h_Sword = "Najprostszy zardzewialy miecz dwureczny";
const string Itmw_StExt_Str_StartingStaff_Name = "Najprostszy magiczny kij";

const string StExt_PlantCloverName = "Koniczyna";
const string StExt_PlantCloverDesc1 = "Niezwykle rzadka roslina!";
const string StExt_PlantCloverDesc2 = "Daje trwaly bonus do szczescia.";

const string StExt_Enchanted_Name_Value = "Zaczarowane | Cena:";

const string StExt_Str_SummonZombieProtector_Name = "Zombie Obronca";
const string StExt_Str_SummonDemonProtector_Name = "Demon Obronca";
const string StExt_Str_SummonGolemProtector_Name = "Golem Obronca";
const string StExt_Str_SummonDarkGolem_Name = "Runiczny Golem Cienia";
const string StExt_Str_SummonWolfProtector_Name = "Wilk Obronca";
const string StExt_Str_SummonBoneHound_Name = "Kosciany Pies";
const string StExt_Str_SummonBoneMage_Name = "Szkielet Mag";
const string StExt_Str_SummonShadow_Name = "Cien";
const string StExt_Str_SummonAirGolem_Name = "Runiczny Golem Powietrza";
const string StExt_Str_SummonElectricGolem_Name = "Runiczny Golem Eteryczny";
const string StExt_Str_SummonHollyWisp_Name = "Swiety Ognik";

/* *** Spell strings *** */
const string StExt_Str_ShamansCantSummon = "Szamani nie moga uzywac magii przyzwania!";
const string StExt_Str_MaxSummonCount = "Osiagnieto maksymalna liczbe przyzwanych stworzen...";
const string StExt_Str_Info = "Informacja";
const string StExt_Str_Info_MaxSummonCount = "Maksymalna liczba przyzwanych stworzen...";

const string stext_name_spl_summondemon_khub = "Przyzwanie Hubaxisa";
const string name_spl_summon_deathhound = "Przyzwanie Koscianego Psa";
const string name_spl_summon_darkgolem = "Przyzwanie Golema Cienia";
const string name_spl_stext_magicbolt = "Magiczna Strzala";
const string name_spl_stext_magicbolt_txt1 = "Najprostsze podstawowe zaklecie dostepne dla kazdego";
const string name_spl_stext_sumhollywisp = "Przyzwanie Swietego Swietlika";
const string name_spl_summon_skeleton_mage = "Przyzwanie Szkieleta Maga";
const string name_spl_summon_airgolem = "Przyzwanie Golema Powietrza";

const string StExt_Str_ScrollmakingRune = "Stworz rune";
const string StExt_Str_TalisanRunen_DkPet = "Stworz rune przyzywajaca Sluge";
const string StExt_Str_TalisanRunen_Crait = "Stworz rune przyzywajaca Kraita";
const string StExt_Str_TalisanRunen_DrSnapper = "Stworz rune przyzywajaca Tesvalla";
const string StExt_Str_TalisanRunen_sumskelmage = "Stworz rune przyzywajaca Szkieleta Maga";
const string StExt_Str_TalisanRunen_hollywisp = "Stworz rune przyzywajaca Swietego Ognika";
const string StExt_Str_TalisanRunen_airgolem = "Stworz rune przyzywajaca Golema Powietrza";
const string StExt_Str_TalisanRunen_rapidicebolt = "Stworz rune Lodowego Blysku";
const string StExt_Str_TalisanRunen_rapidfirebolt = "Stworz rune Szybkiego Ognistego Pocisku";
const string StExt_Str_TalisanRunen_elevate = "Stworz rune Egzaltacji";

const string StExt_EsText = "Tarcza Energii";
const string StExt_RankName_Uncommon = "Niepospolity";
const string StExt_RankName_Magic = "Magia";
const string StExt_RankName_Rare = "Rzadki";
const string StExt_RankName_Uniq = "Unikalny";
const string StExt_RankName_Legend = "Legendarny";

/* *** Ui strings *** */
const string StExt_Ui_MoveNotification = "Uzyj klawiszy strzalek, aby przesunac biezacy element.";
const string StExt_Ui_ValueEditNotification = "Uzyj klawiszy strzalek, aby zmienic biezaca wartosc.";

const string StExt_Str_DisplayModInitialized = "Mod 'EthernalBreeze' uruchomiony!";
const string StExt_Str_NewVersionNotify = "Wykryto nowa wersje moda 'EthernalBreeze'";
const string StExt_Str_DisplayModDailyGrowDiffNotify = "Czas ucieka... Z kazdym dniem Zlo staje sie silniejsze!";
const string StExt_Str_Print_Luckinfo = "Szczescie ci sprzyja...";
const string StExt_Str_Print_Luckinfobonus = "+0,1% do szczescia!";
const string StExt_Str_Print_Luckinfobonus5 = "+0,5% do szczescia!";

const string StExt_Str_CorruptionNotify = "Skazony! Mroczny bog smieje sie z ciebie...";
const string StExt_Str_CantBecomeCorruptedNotify = "Klatwa nie odniosla skutku!";
const string StExt_Str_CantBecomeCorruptedNotify2 = "Zwoj obrocil sie w pyl!";
const string StExt_Str_NeedFeather = "Potrzebne pioro!";
const string StExt_Str_NotTimeNotify = "Jeszcze nie czas...";

/* *** Dialog strings *** */
const string StExt_Str_ModMenu_Configs = "[Ustawienia moda...]";
const string StExt_Str_ModMenu_Education = "[Nauka...]";
const string StExt_Str_ModMenu_DebugEnabled = "Wlacz wyswietlanie informacji debugowania";
const string StExt_Str_ModMenu_PresetsSection = "Wybierz zestaw ustawien (obecne ustawienia zostana zmienione!)";
const string StExt_Str_ModMenu_AuraUi = "Ustawienia wyswietlania aur na ekranie";
const string StExt_Str_ModMenu_AlchUi = "Ustawienia wyswietlania efektow tymczasowych na ekranie";
const string StExt_Str_ModMenu_ArtifactUi = "Ustawienia wyswietlania statystyk artefaktow na ekranie";
const string StExt_Str_ModMenu_EsUi = "Ustawienia wyswietlania tarczy energii na ekranie";
const string StExt_Str_ModMenu_MsgTray = "Ustawienia wyswietlania wiadomosci (mod) na ekranie";
const string StExt_Str_ModMenu_Aura_DisplayOnScreen = "Wyswietlaj aury na ekranie";
const string StExt_Str_ModMenu_Alch_DisplayOnScreen = "Wyswietlaj efekty tymczasowe na ekranie";
const string StExt_Str_ModMenu_Artifact_DisplayOnScreen = "Wyswietlaj statystyki artefaktow na ekranie";
const string StExt_Str_ModMenu_EsBar_DefaultPos = "Pokazuj tarcze energii domyslnie";
const string StExt_Str_ModMenu_Configs_Reset = "Zresetuj obecne ustawienia";
const string StExt_Str_ModMenu_Learning_GenericPerks = "Umiejetnosci Ogolne";
const string StExt_Str_CorruptionMenu = "Uzyj zwoju skazenia...";

const string StExt_Str_ModMenu_CurrentDiffPreset = "Obecny zestaw trudnosci: ";
const string StExt_Str_ModMenu_CurrentItemsPreset = "Obecny zestaw generatora przedmiotow: ";

/* *** Npc dialog strings *** */
const string Stext_Str_Dia_Xardas_SelectDiff = "Wybierz poziom trudnosci moda...";
const string Stext_Str_Dia_Xardas_SelectPreHistory = "Wybierz historie postaci...";

const string StExt_Str_StonedTrader_Name = "SHIVA - Czarnoksieznik-Smieciarz";
const string StExt_Str_StonedTrader_Trade = "Handluj...";
const string StExt_Str_Andriel_Name = "Andriel";
const string StExt_Str_Andriel_Dagger_Name = "Ostrze Andriel";
const string StExt_Str_Duriel_Name = "Duriel";
const string StExt_Str_Mephisto_Name = "Mefisto";
const string StExt_Str_Diablo_Name = "Diablo";
const string StExt_Str_Baal_Name = "Baal";

const string StExt_Str_Bosslletter_Desc = "Mozna uzyc tylko w niezamieszkalych miejscach...";
const string StExt_Str_Andrielletter_Name = "Zwoj Przyzwania Andrielle";
const string StExt_Str_Andrielletter_Desc = "Przyzywa Andrielle, pierwszego demona Shivy...";
const string StExt_Str_Durielletter_Name = "Zwoj Przyzwania Duriela";
const string StExt_Str_Durielletter_Desc = "Przyzywa Duriela, drugiego demona Shivy...";
const string StExt_Str_Mephistoletter_Name = "Zwoj Przyzwania Mefista";
const string StExt_Str_Mephistoetter_Desc = "Przyzywa Mefista, trzeciego demona Shivy...";
const string StExt_Str_Diabloletter_Name = "Zwoj Przyzwania Diablo";
const string StExt_Str_Diabloletter_Desc = "Przyzywa Diablo, czwartego demona Shivy...";
const string StExt_Str_Baalletter_Name = "Zwoj Przyzwania Baala";
const string StExt_Str_Baalletter_Desc = "Przyzywa Baala, piatego demona Shivy...";

const string StExt_Str_Shivaletter_Name = "Notatka Smieciarza";
const string StExt_Str_Shivaletter_Desc = "Te notatke dal mi Shiva, czarnoksieznik-smieciarz...";
const string StExt_Str_Shivaletter_Info = "Witaj, wedrowcze. \\n Nazywam sie Shiva i jestem mistrzem tworzenia artefaktow, ale nie o to teraz chodzi. Rzecz w tym, ze niedawno, podczas eksperymentow z duchami z innych planow istnienia, ponioslem porazke i stracilem glos. Piec potwornych istot z innych swiatow przekielo mnie klatwa niemoty, a jedynie ich calkowite zniszczenie przywroci mi mowe. \\n Te istoty to niezwykle niebezpieczni przeciwnicy i nie poradze sobie z nimi sam, dlatego prosze cie, wedrowcze, o pomoc w mej sprawie. W zamian za pomoc otrzymasz ode mnie unikalne artefakty, jakich nie znajdziesz nigdzie indziej w calej Myrtanie. \\n Zapytaj mnie, gdy bedziesz gotow stanac do walki ze zlem, dam ci wtedy pierwszy zwoj przyzwania...";
const string StExt_Topic_Shivaletter = "Niemy Wyczyn";
const string StExt_Str_Shivaletter_Logentry_0 = "Handlujacy zlomem czarnoksieznik, a przy okazji mistrz artefaktor, poprosil mnie w liscie o rozprawienie sie z piecioma demonami z innych swiatow. Musze zdobyc od niego zwoj przyzywajacy pierwszego z demonow.";
const string StExt_Str_Shivaletter_Logentry_1 = "Otrzymalem od Shivy dziwny zwoj. Sadze, ze powinienem udac sie w odludne miejsce i przyzwac pierwszego demona, gdy tylko bede gotow...";
const string StExt_Str_Shivaletter_Logentry_2 = "Udalo mi sie zniszczyc Andriel. Powinienem porozmawiac z Shiva o nagrodzie.";
const string StExt_Str_Shivaletter_Logentry_3 = "Shiva dal mi kolejny zwoj przyzwania. Pentagram glosi 'Duriel'. Chyba to moj nastepny cel...";
const string StExt_Str_Shivaletter_Logentry_4 = "Duriel pokonany. Sadze, ze Shiva ucieszy sie na te wiesc.";
const string StExt_Str_Shivaletter_Logentry_5 = "Jak mozna sie bylo spodziewac, Shiva dal mi zwoj przyzywajacy kolejnego demona. Tym razem Mefista. To wszystko cos mi przypomina...";
const string StExt_Str_Shivaletter_Logentry_6 = "Zniszczylem Mefista. Sadze, ze Shiva ucieszy sie z tej wiesci.";
const string StExt_Str_Shivaletter_Logentry_7 = "Moim nastepnym celem jest Diablo.";
const string StExt_Str_Shivaletter_Logentry_8 = "Diablo padl z mojej reki. Czy powinienem pojsc ucieszyc czarnoksieznika?";
const string StExt_Str_Shivaletter_Logentry_9 = "Pozostal ostatni demon - Baal. Sadze, ze nie powinnismy tracic czasu i szybko go wykonczyc.";
const string StExt_Str_Shivaletter_Logentry_10 = "Nareszcie! Baal zniszczony. Ciekawe, jaka nagrode przygotowal dla mnie ten czarnoksieznik?";
const string StExt_Str_Shivaletter_Logentry_11 = "Wysmienicie. Uwolnilem Shive od klatwy i pomoglem mu odzyskac glos.";

const string StExt_Str_StonedTrader_Hi = "Jak sie masz, przyjacielu?";
const string StExt_Str_StonedTrader_AndrielReady = "Jak moge ci pomoc?";
const string StExt_Str_StonedTrader_AndrielDone = "Rozprawilem sie z Andriel!";
const string StExt_Str_StonedTrader_DurielDone = "Duriel skonczony!";
const string StExt_Str_StonedTrader_MephistoDone = "Mefisto pokonany!";
const string StExt_Str_StonedTrader_DiabloDone = "Zniszczylem Diablo!";
const string StExt_Str_StonedTrader_BaalDone = "Baal...";

const string StExt_Str_TalisanRunen_sumdeathhound = "Stworz rune przyzywajaca Koscianego Psa";
const string StExt_Str_TalisanRunen_sumdarkgol = "Stworz rune przyzywajaca Golema Cienia";

const string StExt_Str_XardasRunen_Demon = "Runa Demonologa";
const string StExt_Str_XardasRunen_Death6 = "6. krag magii (Smierc)";
const string StExt_Str_XardasRunen_Death5 = "5. krag magii (Smierc)";
const string StExt_Str_XardasRunen_Death4 = "4. krag magii (Smierc)";
const string StExt_Str_XardasRunen_Death3 = "3. krag magii (Smierc)";
const string StExt_Str_XardasRunen_Death2 = "2. krag magii (Smierc)";
const string StExt_Str_XardasRunen_Death1 = "1. krag magii (Smierc)";
const string StExt_Str_XardasRunen_Necro6 = "6. krag magii (Nekromancja)";
const string StExt_Str_XardasRunen_Necro5 = "5. krag magii (Nekromancja)";
const string StExt_Str_XardasRunen_Necro4 = "4. krag magii (Nekromancja)";
const string StExt_Str_XardasRunen_Necro3 = "3. krag magii (Nekromancja)";
const string StExt_Str_XardasRunen_Necro2 = "2. krag magii (Nekromancja)";
const string StExt_Str_XardasRunen_Necro1 = "1. krag magii (Nekromancja)";
const string StExt_Str_XardasRunen_Dark6 = "6. krag magii (Mrok)";
const string StExt_Str_XardasRunen_Dark5 = "5. krag magii (Mrok)";
const string StExt_Str_XardasRunen_Dark4 = "4. krag magii (Mrok)";
const string StExt_Str_XardasRunen_Dark3 = "3. krag magii (Mrok)";
const string StExt_Str_XardasRunen_Dark2 = "2. krag magii (Mrok)";
const string StExt_Str_XardasRunen_Dark1 = "1. krag magii (Mrok)";

const string StExt_Str_Scrollmaking_RequirePaper = "Wymagane sa nastepujace zasoby: ";
const string StExt_Str_ScrollmakingDone = "Zwoj stworzony!";
const string StExt_Str_ScrollmakingFire = "Tworz zwoje magii ognia";
const string StExt_Str_Scrollmakingice = "Tworz zwoje magii lodu";
const string StExt_Str_ScrollmakingAir = "Tworz zwoje magii powietrza";
const string StExt_Str_ScrollmakingElectric = "Tworz zwoje magii elektrycznosci";
const string StExt_Str_ScrollmakingEarth = "Tworz zwoje magii ziemi";
const string StExt_Str_ScrollmakingLight = "Tworz zwoje swietej magii";
const string StExt_Str_ScrollmakingDeath = "Tworz zwoje magii smierci";
const string StExt_Str_ScrollmakingLife = "Tworz zwoje magii zycia";
const string StExt_Str_ScrollmakingDark = "Tworz zwoje mrocznej magii";
const string StExt_Str_ScrollmakingGolems = "Tworz zwoje tworzenia golemow";
const string StExt_Str_ScrollmakingDemonology = "Tworz zwoje demonologii";
const string StExt_Str_ScrollmakingNecro = "Tworz zwoje nekromancji";
const string StExt_Str_ScrollmakingBlinkTxt = "Skok";

const string StExt_Str_Grimoir_NewLevel = "Grymuar mozna ulepszyc";
const string StExt_Str_Dagger_NewLevel = "Sztylet mozna ulepszyc";

const string StExt_Craftsman_Str_LearnCraft = "Czy mozesz nauczyc mnie swojego rzemiosla?";
const string StExt_Craftsman_Str_RequiredGoldStart = "Aby nauczyc sie rzemiosla, potrzebujesz";
const string StExt_Craftsman_Str_RequiredGoldEnd = "sztuk zlota!";

const string StExt_Craftsman_Str_BosperCraftLearned = "Bosper zgadza sie nauczyc cie swojego rzemiosla!";
const string StExt_Craftsman_Str_HaradCraftLearned = "Harad zgadza sie nauczyc cie swojego rzemiosla!";
const string StExt_Craftsman_Str_ConstantionoCraftLearned = "Constantino zgadza sie nauczyc cie swojego rzemiosla!";

const string StExt_Craftsman_CanStudy_Constantino_SellElixirs = "Przynioslem magiczne eliksiry";
const string StExt_Craftsman_CanStudy_Constantino_SellPlants = "Przynioslem rzadkie ziola";


// *********************************************************************************
// New strings
// *********************************************************************************

const string StExt_Ui_ValueEditNotification_Step = "Krok zmiany wartosci: x";
const string StExt_Str_ValueEdit_Yes = "Wstecz... (Zaakceptuj nowa wartosc)";
const string StExt_Str_ValueEdit_No = "Przywroc stara wartosc";
const string StExt_Str_ValueEdit_Max = "Ustaw wartosc: [Maksimum]";
const string StExt_Str_ValueEdit_Min = "Ustaw wartosc: [Minimum]";
const string StExt_Str_ValueEdit_Zero = "Ustaw wartosc: [Zero]";

const string StExt_Str_NpcFlag_LootProcessed = "Spladrowany";
const string StExt_Str_NpcFlag_IsDead = "Martwy";
const string StExt_Str_NpcFlag_Duplicated = "Podwojny";
const string StExt_Str_NpcFlag_Summoned = "Przyzwany";
const string StExt_Str_NpcFlag_Corrupted = "Skazony";
const string StExt_Str_NpcFlag_Lucky = "Szczesliwy";
const string StExt_Str_NpcFlag_Rich = "Bogaty";
const string StExt_Str_NpcFlag_Original = "Prawdziwy";

const string StExt_Str_Config_ShowNpcExtraInfo = "Pokaz cechy NPC";

const string StExt_Str_NpcStats_Str = "Od: ";
const string StExt_Str_NpcStats_Agi = "Pz: ";
const string StExt_Str_NpcStats_Prot = "Obr: ";
const string StExt_Str_NpcStats_Resist = "Odpornosc: ";
const string StExt_Str_NpcStats_Dodge = "Unik: ";

const string StExt_Str_NpcStats_ProtEdge = "O - ";
const string StExt_Str_NpcStats_ProtBlunt = "Z - ";
const string StExt_Str_NpcStats_ProtFire = "O - ";
const string StExt_Str_NpcStats_ProtFly = "Wt - ";
const string StExt_Str_NpcStats_ProtMagic = "M - ";
const string StExt_Str_NpcStats_ProtPoint = "Od - ";
const string StExt_Str_NpcStats_ProtPois = "Trucizna - ";
const string StExt_Str_NpcStats_ProtAoe = "Obszar - ";

const string StExt_Str_Level = "Poziom: ";
const string StExt_Str_Exp = "Doswiadczenie: ";
const string StExt_Str_Lp = "MP: ";
const string StExt_Str_Auras = "Aury: ";
const string StExt_Str_ActiveAuras = "Aktywne aury: ";
const string StExt_Str_Masteries = "Umiejetnosci: ";
const string StExt_Str_NeedGold = "Potrzebne zloto: ";
const string StExt_Str_NeedLp = "Potrzebne punkty treningu: ";
const string StExt_Str_NeedSkillPoints = "Potrzebne punkty umiejetnosci: ";
const string StExt_Str_Required = "Wymagane: ";
const string StExt_Str_Pcs = "szt.";
const string StExt_Str_Done = "Gotowe!";

const string StExt_Str_Required_Hp = "sily zywotne";
const string StExt_Str_Required_Mp = "moce magiczne";
const string StExt_Str_Required_Intellect = "inteligencja";
const string StExt_Str_Required_Str = "sila";
const string StExt_Str_Required_Agi = "zrecznosc";
const string StExt_Str_Required_Stam = "wytrzymalosc";
const string StExt_Str_Required_Gold = "zloto";
const string StExt_Str_Required_Lp = "pn";

const string StExt_Str_NpcFlag_ScrollUser = "Uzywa zwojow";
const string StExt_Str_NpcFlag_Summoner = "Przyzywacz";
const string StExt_Str_NpcFlag_Priest = "Blogoslawiony";
const string StExt_Str_NpcFlag_Curser = "Przeklinajacy";

// New strings
const string StExt_Str_PrehistoryDesc[StExt_PreHistoryMode_Max] =
{
	" (Nic)",
	"(+500 doswiadczenia)",
	"(+2 sily, +1 zrecznosci, +10 zdrowia)",
	"(+1 sily, +2 zrecznosci, +10 zdrowia)",
	"(+2 sily, +3 many, +10 zdrowia)",
	"(+1 inteligencji, +1% mocy magicznej)",
	"(+2 inteligencji, +7 many)",
	"(+15 many)",
	"(+1% mocy magicznej, +5 many)",
	"(+15 zdrowia, +250 sztuk zlota)",
	"(+10 wytrzymalosci, +10 zdrowia)"
};

// Items constants
const string StExt_Str_ItemRank[StExt_ItemRankMax] =
{
	"Normalny",
	"Niezwykly",
	"Rzadki",
	"Unikalny",
	"Epicki",
	"Legendarny"
};


const string StExt_Str_Item_Type[9] =
{
    "???",
    "Zbroja",
    "Bron",
    "Ozdoba",
    "Przedmiot Zuzywalny",
    "Amunicja",
    "Ekwipunek",
    "Rzemioslo",
    "Inne"
};

const string StExt_Str_Item_Class[27] =
{
    "???",
    "Zbroja",
    "Helm",
    "Tors",
    "Spodnie",
    "Rekawice",
    "Buty",
    "Naramienniki",
    "Tarcza",
    "Bron do walki wrecz",
    "Bron dystansowa",
    "Magia",
    "Amulet",
    "Pierscien",
    "Kolczyki",
    "Bransolety",
    "Pas",
    "Kolnierz",
    "Trofeum",
    "Mikstura",
    "Zwoj",
    "Jedzenie",
    "Maskotka",
    "Klejnot",
    "Runa",
    "Dusza",
    "Rozne"
};

const string StExt_Str_Item_SubClass[39] =
{
    "???",
    "Tkanina",
    "Lekka Zbroja",
    "Srednia Zbroja",
    "Ciezka Zbroja",
    "Kaptur",
    "Diadem",
    "Lekki Helm",
    "Sredni Helm",
    "Ciezki Helm",
    "Lekka Tarcza",
    "Ciezka Tarcza",
    "Miecz Jednoreczny",
    "Topor Jednoreczny",
    "Bulawa Jednoreczna",
    "Sztylet",
    "Rapier",
    "Lekki Miecz",
    "Ostrze Czarnoksieznika",
    "Miecz Dwureczny",
    "Topor Dwureczny",
    "Bulawa Dwureczna",
    "Kij",
    "Wlocznia",
    "Halabarda",
    "Sparowana (Lewa)",
    "Sparowana (Prawa)",
    "Kastet",
    "Sztylet do Rzucania",
    "Topor do Rzucania",
    "Bulawa do Rzucania",
    "Wlocznia do Rzucania",
    "Lekki Luk",
    "Ciezki Luk",
    "Lekka Kusza",
    "Ciezka Kusza",
    "Zwoj",
    "Runa",
    "Rozdzka"
};

//*********************************DELETE************************************************
const string StExt_Str_ItemType[28] =
{
    /*ItemType_Helm*/ "Helm",
    /*ItemType_Armor*/ "Zbroja",
    /*ItemType_Pants*/ "Spodnie",
    /*ItemType_Boots*/ "Buty",
    /*ItemType_Gloves*/ "Rekawice",
    /*ItemType_Belt*/ "Pas",
    /*ItemType_Amulet*/ "Amulet",
    /*ItemType_Ring*/ "Pierscien",
    /*ItemType_Shield*/ "Tarcza",
    /*ItemType_Sword1h*/ "Miecz Jednoreczny",
    /*ItemType_Sword2h*/ "Miecz Dwureczny",
    /*ItemType_Axe1h*/ "Topor Jednoreczny",
    /*ItemType_Axe2h*/ "Topor Dwureczny",
    /*ItemType_Mace1h*/ "Bulawa Jednoreczna",
    /*ItemType_Mace2h*/ "Bulawa Dwureczna",
    /*ItemType_MagicSword*/ "Bron Magiczna",
    /*ItemType_Staff*/ "Kij",
    /*ItemType_Rapier*/ "Rapier",
    /*ItemType_DexSword*/ "Lekki Miecz",
    /*ItemType_Halleberd*/ "Halabarda",
    /*ItemType_Spear*/ "Wlocznia",
    /*ItemType_DualL*/ "Sparowana, Lewa",
    /*ItemType_DualR*/ "Sparowana, Prawa",
    /*ItemType_Bow*/ "Luk",
    /*ItemType_CrossBow*/ "Kusza",
    /*ItemType_MagicStaff*/ "Zaczarowany Kij",
    /*ItemType_Potion*/ "Mikstura",
    /*ItemType_Scroll*/ "Zwoj"
};

const string StExt_Str_ItemFlag[16] =
{
    /*ItemFlag_Undefined*/ "Nieokreslone",
    /*ItemFlag_Socketed*/ "Z gniazdami",
    /*ItemFlag_Corrupted*/ "Skazony",
    /*ItemFlag_Crafted*/ "Rzemieslnicze",
    /*ItemFlag_Armor*/ "Zbroja",
    /*ItemFlag_Weapon*/ "Bron",
    /*ItemFlag_Jewelry*/ "Bizuteria",
    /*ItemFlag_Talisman*/ "Talizman",
    /*ItemFlag_Consumable*/ "Przedmiot Zuzywalny",
    /*ItemFlag_Melee*/ "Walka Wrecz",
    /*ItemFlag_Range*/ "Walka Dystansowa",
    /*ItemFlag_Staff*/ "Kij",
    /*ItemFlag_LeftHand*/ "Lewa Reka",
    /*ItemFlag_RightHand*/ "Prawa Reka",
    /*ItemFlag_BothHands*/ "Obie Rece",
    /*ItemFlag_MagicWeapon*/ "Magia"
};

const string StExt_Str_ItemFlag_Socketed = "Z gniazdami";
const string StExt_Str_ItemFlag_Corrupted = "Skazony";
const string StExt_Str_ItemFlag_Crafted = "Rzemieslnicze";
const string StExt_Str_ItemFlag_Undefined = "Niezidentyfikowany";
//*********************************DELETE************************************************


const string StExt_Str_Item_Cond = "Wymagania: ";
const string StExt_Str_Item_Cond_Str = "sila";
const string StExt_Str_Item_Cond_Agi = "zrecznosc";
const string StExt_Str_Item_Cond_Hp = "zycie";
const string StExt_Str_Item_Cond_Mp = "mana";
const string StExt_Str_Item_Cond_St = "wytrzymalosc";
const string StExt_Str_Item_Cond_Shield = "umiejetnosc tarczy";
const string StExt_Str_Item_Cond_Bow = "umiejetnosc luku";
const string StExt_Str_Item_Cond_CBow = "umiejetnosc kuszy";
const string StExt_Str_Item_Cond_OneHanded = "umiejetnosc broni jednorecznej";
const string StExt_Str_Item_Cond_TwoHanded = "umiejetnosc broni dwurecznej";
const string StExt_Str_Item_Cond_Int = "inteligencja";
const string StExt_Str_Item_Cond_Level = "poziom";
const string StExt_Str_Item_Cond_BeliarKarma = "karma (Beliar)";
const string StExt_Str_Item_Cond_InnosKarma = "karma (Innos)";
const string StExt_Str_Item_Cond_AdanosKarma = "karma (Adanos)";

const string StExt_Str_Item_Damage = "Obrazenia: ";
const string StExt_Str_Item_DamageType[dam_index_max] =
{
	"prawdziwe",
	"miazdzace",
	"sieczne",
	"ogien",
	"odrzut",
	"magia",
	"klute",
	"trucizna"
};
const string StExt_Str_Item_Protection = "Ochrona: ";
const string StExt_Str_Item_Range = "Dlugosc broni: ";
const string StExt_Str_OrcWeapon = "Bron Orkow";
const string StExt_Str_OneHandWeapon = "Jednoreczna";
const string StExt_Str_TwoHandWeapon = "Dwureczna";

const string StExt_Str_ItemLevel = "Poziom przedmiotu: ";
const string StExt_Str_ItemQuality = "Jakosc: ";
const string StExt_Str_ItemSockets = "Gniazda: ";
const string StExt_Str_Undefined = "Niezidentyfikowany!";

const string itar_StExt_Str_helmet_crone_name = "Korona Lodu";
const string itam_stext_silvernecklace_name = "Srebrny Amulet";
const string itam_stext_goldnecklace_name = "Zloty Amulet";
const string itam_stext_darknecklace_name = "Amulet Cienia";
const string itri_stext_silverring_name = "Srebrny Pierscien";
const string itri_stext_goldring_name = "Zloty Pierscien";

const string StExt_Str_ModMenu_ItemsInfoUi = "Ustawienia wyswietlania dodatkowych informacji o przedmiotach";

const string StExt_Str_Config_Luck_ChanceForEnchantedDrop = "Szansa, ze znaleziony przedmiot bedzie zaczarowany";
const string StExt_Str_Config_Luck_RelativeDropChance_Food = "Wzgledna szansa upuszczenia jedzenia";
const string StExt_Str_Config_Luck_RelativeDropChance_Alchemy = "Wzgledna szansa upuszczenia alchemii";
const string StExt_Str_Config_Luck_RelativeDropChance_Magic = "Wzgledna szansa upuszczenia magii";
const string StExt_Str_Config_Luck_RelativeDropChance_Misk = "Wzgledna szansa upuszczenia roznych przedmiotow";
const string StExt_Str_Config_Luck_RelativeDropChance_Munition = "Wzgledna szansa upuszczenia strzal";
const string StExt_Str_Config_Luck_RelativeDropChance_Armors = "Wzgledna szansa upuszczenia zbroi";
const string StExt_Str_Config_Luck_RelativeDropChance_Jewelry = "Wzgledna szansa upuszczenia bizuterii";
const string StExt_Str_Config_Luck_RelativeDropChance_MagicWeapons = "Wzgledna szansa upuszczenia broni magicznej";
const string StExt_Str_Config_Luck_RelativeDropChance_MeeleWeapons = "Wzgledna szansa upuszczenia broni do walki wrecz";
const string StExt_Str_Config_Luck_RelativeDropChance_RangeWeapons = "Wzgledna szansa upuszczenia broni dystansowej";

const string StExt_Str_Config_FoodBonusResetDay = "Dni do zresetowania bonusow z jedzenia";

const string itse_stext_poitionfish_name = "Przeklety Okon-Alchemik";
const string itse_stext_magicfish_name = "Zalatany Sum-Okultysta";
const string itse_stext_miscfish_name = "Zaszyty Karas-Zlotnik";
const string itse_stext_rndfish_desc = "W tej rybie cos zaszyto...";

const string stext_str_halvor_openfish = "(Otworz wszystkie specjalne ryby)";
const string stext_str_halvor_openfish_nofish = "Nie ma tu zadnych ryb!";

const string itmi_stext_lootchest_name = "Stalowa Szkatulka";
const string itmi_stext_lootchest_dsec = "Na jednej ze scian wyryto imie 'Shiva'...";

const string itmi_stext_lootchest_Helm_dsec = "Wyglada na to, ze jest tu helm";
const string itmi_stext_lootchest_Armor_dsec = "Wyglada na to, ze jest tu zbroja";
const string itmi_stext_lootchest_Pants_dsec = "Wyglada na to, ze sa tu spodnie";
const string itmi_stext_lootchest_Boots_dsec = "Wyglada na to, ze sa tu buty";
const string itmi_stext_lootchest_Gloves_dsec = "Wyglada na to, ze sa tu rekawice";
const string itmi_stext_lootchest_Belt_dsec = "Wyglada na to, ze jest tu pas";
const string itmi_stext_lootchest_Amulet_dsec = "Wyglada na to, ze jest tu amulet";
const string itmi_stext_lootchest_Ring_dsec = "Wyglada na to, ze jest tu pierscien";
const string itmi_stext_lootchest_Shield_dsec = "Wyglada na to, ze jest tu tarcza";
const string itmi_stext_lootchest_Sword1h_dsec = "Wyglada na to, ze jest tu miecz jednoreczny";
const string itmi_stext_lootchest_Sword2h_dsec = "Wyglada na to, ze jest tu miecz dwureczny";
const string itmi_stext_lootchest_Axe1h_dsec = "Wyglada na to, ze jest tu topor jednoreczny";
const string itmi_stext_lootchest_Axe2h_dsec = "Wyglada na to, ze jest tu topor dwureczny";
const string itmi_stext_lootchest_Mace1h_dsec = "Wyglada na to, ze jest tu bulawa jednoreczna";
const string itmi_stext_lootchest_Mace2h_dsec = "Wyglada na to, ze jest tu bulawa dwureczna";
const string itmi_stext_lootchest_MagicSword_dsec = "Wyglada na to, ze jest tu miecz magiczny";
const string itmi_stext_lootchest_Staff_dsec = "Wyglada na to, ze jest tu kij";
const string itmi_stext_lootchest_Rapier_dsec = "Wyglada na to, ze jest tu miecz";
const string itmi_stext_lootchest_DexSword_dsec = "Wyglada na to, ze jest tu lekki miecz";
const string itmi_stext_lootchest_Halleberd_dsec = "Wyglada na to, ze jest tu halabarda";
const string itmi_stext_lootchest_Spear_dsec = "Wyglada na to, ze jest tu wlocznia";
const string itmi_stext_lootchest_Dual_dsec = "Wyglada na to, ze jest tu podwojna bron";
const string itmi_stext_lootchest_Bow_dsec = "Wyglada na to, ze jest tu luk refleksyjny";
const string itmi_stext_lootchest_CrossBow_dsec = "Wyglada na to, ze jest tu kusza";
const string itmi_stext_lootchest_MagicStaff_dsec = "Wyglada na to, ze jest tu magiczny kij";
const string itmi_stext_lootchest_Torso_dsec = "Wyglada na to, ze jest tu napiersnik";

const string itpo_stext_potion_01_name = "Nasycenie";
const string itpo_stext_potion_02_name = "Esencja";
const string itpo_stext_potion_03_name = "Ekstrakt";
const string itpo_stext_potion_04_name = "Eliksir";
const string itpo_stext_potion_desc = "Mikstura o niezwyklych wlasciwosciach...";

const string StExt_BonusStats_Desc[5] =
{
	"Bonusy z Przedmiotow",
	"Bonusy z artefaktu",
	"Bonusy z Mikstur",
	"Bonusy z efektow tymczasowych",
	"Bonusy z Aury"
};

const string StExt_Str_Menu_Dagger = "[Zbadaj Sztylet]";
const string StExt_Str_Menu_Grimoir = "[Zbadaj Grymuar]";
const string StExt_Str_AtrifactNotEnoughtLp = "Za malo punktow rozwoju artefaktu. Wymagane: ";
const string StExt_Str_Config_ArtifactsUpgradeCostMult = "Koszt ulepszenia artefaktu";
const string StExt_Str_Config_ArtifactExp = "doswiadczenie";
const string StExt_Str_Config_Artifact_ShowExpMessage = "Wyswietlaj na ekranie doswiadczenie zdobyte przez artefakt";
const string StExt_Str_AtrifactEquip = "Zaloz artefakt";
const string StExt_Str_AtrifactUnEquip = "Zdejmij artefakt";
const string itmi_stext_orestuck_desc = "Wazny skladnik do zaawansowanego rzemiosla";

const string itmw_stext_halleberde_bronze_name = "Brazowa Halabarda";
const string itmw_stext_spear_bronze_name = "Brazowa Wlocznia";
const string itmw_stext_bronze_axe_name = "Brazowy Topor";
const string itmw_stext_bronze_waraxe_name = "Brazowy Topor Bojowy";
const string itmw_stext_bronze_warhammer_name = "Brazowy Mlot Bojowy";
const string itmw_stext_bronze_mace_name = "Brazowa Bulawa";
const string itmw_stext_bronze_shortsword_name = "Brazowy Krotki Miecz";
const string itmw_stext_bronze_broadsword_name = "Brazowy Miecz Obosieczny";
const string itmw_stext_bronze_longsword_name = "Brazowy Dlugi Miecz";
const string itmw_stext_axe1_name = "Topor";
const string itmw_stext_axe2_name = "Topor";
const string itmw_stext_1h_bastard_meryl_name = "Miecz";
const string itmw_stext_1h_bastard_sword_name = "Miecz";
const string itmw_stext_1h_cutlass_name = "Sztylet Szkocki";
const string itmw_stext_1h_bastard_sword1_name = "Jednoreczny Miecz Bekarci";
const string itmw_stext_1h_bastard_sword2_name = "Jednoreczny Miecz Bekarci";
const string itmw_stext_1h_sword_heavy_name = "Ciezki Miecz Jednoreczny";
const string itmw_stext_1h_sword_long_name = "Jednoreczny Dlugi Miecz";
const string itmw_stext_1h_warsickle_name = "Kosa Bojowa";
const string itmw_stext_2h_axe_name = "Topor Dwureczny";
const string itmw_stext_spear_1_name = "Wlocznia";
const string itmw_stext_spear_2_name = "Wlocznia";
const string itmw_stext_2h_scimitar_name = "Dwureczny Szabla";
const string itmw_stext_spear_3_name = "Wlocznia";
const string itmw_stext_2h_sword_name = "Miecz Dwureczny";
const string itmw_stext_axe3_name = "Topor";
const string itmw_stext_axe4_name = "Topor";
const string itmw_stext_1h_crawlerschreck_name = "Postrach Pelzaczy";
const string itmw_stext_1H_Sword_Bastard_Smith_01_name = "Miecz";
const string itmw_stext_1H_Sword_Bastard_Smith_02_name = "Miecz";
const string itmw_stext_1h_Sword_Broad_Rep_02_name = "Miecz Obosieczny";
const string itmw_stext_1H_Sword_Broad_Smith_01_name = "Miecz Obosieczny";
const string itmw_stext_1h_Sword_Broad_Smith_02_name = "Miecz Obosieczny";
const string itmw_stext_1H_Sword_Long_Mission_name = "Dlugi Miecz";
const string itmw_stext_1H_Sword_Long_Smith_01_name = "Miecz";
const string itmw_stext_1H_Sword_Long_Smith_02_name = "Miecz";
const string itmw_stext_1H_Sword_Rep_01_name = "Miecz";
const string itmw_stext_1H_Sword_Rep_02_name = "Miecz";
const string itmw_stext_1H_Sword_Smith_01_name = "Miecz";
const string itmw_stext_1H_Sword_Smith_02_name = "Miecz";
const string itmw_stext_2H_Sword_Heavy_Smith_01_name = "Miecz";
const string itmw_stext_2H_Sword_Heavy_Smith_02_name = "Miecz";
const string itmw_stext_2H_Sword_Light_Smith_01_name = "Miecz";
const string itmw_stext_2H_Sword_Light_Smith_02_name = "Miecz";
const string itmw_stext_2H_Sword_Smith_02_name = "Miecz";
const string itmw_stext_2H_Sword_Smith_01_name = "Miecz";
const string itmw_stext_rapier_name = "Rapier";
const string itmw_stext_2H_Glaubensbringer_name = "Zwiastun Wiary";
const string itar_StExt_greathelm_name = "Wielki Helm";
const string itar_StExt_ancienthelm_name = "Starozytny Helm";
const string itar_stext_hat_beliar_name = "Kaptur Beliara";
const string itar_stext_hat_mage_grey_name = "Kapelusz Maga";
const string itar_stext_kapalin_1_name = "Kapalin";
const string itar_stext_kapalin_2_name = "Kapalin";
const string itar_stext_kapalin_3_name = "Kapalin";
const string itar_stext_kapalin_4_name = "Kapalin";
const string itmw_stext_iron_axe_name = "Zelazny Topor";
const string itmw_stext_iron_broadsword_name = "Zelazny Miecz Obosieczny";
const string itmw_stext_iron_claymore_name = "Zelazny Claymore";
const string itmw_stext_iron_club_name = "Zelazna Maczuga";
const string itmw_stext_iron_dagger_name = "Zelazny Sztylet";
const string itmw_stext_iron_heavyclaymore_name = "Zelazny Ciezki Claymore";
const string itmw_stext_iron_longsword_name = "Zelazny Dlugi Miecz";
const string itmw_stext_iron_mace_name = "Zelazna Bulawa";
const string itmw_stext_iron_mastersword_name = "Mistrzowski Zelazny Miecz";
const string itmw_stext_iron_shortsword_name = "Zelazny Krotki Miecz";
const string itmw_stext_iron_waraxe_name = "Zelazny Topor Bojowy";
const string itmw_stext_iron_warhammer_name = "Zelazny Mlot Bojowy";
const string itmw_stext_2h_SleeperEye_name = "Miecz Dwureczny Oko Spiacego";
const string itmw_stext_2H_Sword_Blaise_name = "Miecz Dwureczny Blaise";
const string itmw_stext_new_stl_broadsword_name = "Stalowy Miecz Obosieczny";
const string itmw_stext_new_stl_claymore_name = "Stalowy Claymore";
const string itmw_stext_new_stl_dagger_name = "Stalowy Sztylet";
const string itmw_stext_new_stl_greatsword_name = "Stalowy Wielki Miecz";
const string itmw_stext_new_stl_handaxe_name = "Stalowy Topor Reczny";
const string itmw_stext_new_stl_mastersword_name = "Mistrzowski Stalowy Miecz";
const string itmw_stext_new_stl_waraxe_name = "Stalowy Topor Bojowy";
const string itmw_stext_new_stl_wingsword_name = "Stalowy Miecz Skrzydlaty";
const string itmw_stext_Novizenhueter_name = "Miecz Straznika";
const string itar_stext_shield_NTARCZA33_name = "Puklerz";
const string itmw_stext_palasz_name = "Miecz Obosieczny";
const string itmw_stext_palasz2_name = "Miecz Obosieczny";
const string itmw_stext_PALKA2_name = "Kij";
const string itmw_stext_Saber_01_name = "Szabla";
const string itmw_stext_Saber_02_name = "Szabla";
const string itmw_stext_Saber_03_name = "Szabla";
const string itmw_stext_Saber_04_01_name = "Szabla";
const string itmw_stext_Saber_04_02_01_name = "Szabla";
const string itmw_stext_Saber_04_02_02_name = "Szabla";
const string itmw_stext_Saber_05_name = "Szabla";
const string itar_stext_collar_name = "Przeklety Kolnierz";
const string itar_stext_collar_desc1 = "Az cuchnie mroczna magia...";
const string itar_stext_collar_desc2 = "Moze lepiej tego nie ruszac?";
const string itmw_stext_steel_axe_name = "Stalowy Topor";
const string itmw_stext_steel_broadsword_name = "Stalowy Miecz Obosieczny";
const string itmw_stext_steel_claymore_name = "Stalowy Claymore";
const string itmw_stext_steel_club_name = "Stalowa Maczuga";
const string itmw_stext_holy_hammer_name = "Swiety Mlot";
const string itmw_stext_steel_dagger_name = "Stalowy Sztylet";
const string itmw_stext_steel_heavyclaymore_name = "Stalowy Ciezki Claymore";
const string itmw_stext_steel_longsword_name = "Stalowy Dlugi Miecz";
const string itmw_stext_steel_mace_name = "Stalowa Bulawa";
const string itmw_stext_steel_mastersword_name = "Mistrzowski Stalowy Miecz";
const string itmw_stext_steel_shortsword_name = "Stalowy Krotki Miecz";
const string itmw_stext_steel_waraxe_name = "Stalowy Topor Bojowy";
const string itmw_stext_steel_warhammer_name = "Stalowy Mlot Bojowy";
const string itar_stext_hut_name = "Kapelusz";
const string itar_stext_wreath_name = "Wieniec";
const string itar_stext_plaguehood_name = "Maska Zarazy";
const string itar_stext_hood_name = "Kaptur";

const string itar_stext_gloves_name = "Naramienniki";
const string itar_stext_boots_name = "Nagolenniki";
const string itar_stext_pants_name = "Spodnie";
const string itar_stext_torso_name = "Napiersnik";

const string StExt_Str_ExtraItemsDisplayMode = "Tryb wyswietlania dodatkowych elementow zbroi";
const string StExt_Str_ExtraItemsDisplayModes[4] =
{
	"Ukryj dodatkowe elementy zbroi przy oryginalnej zbroi",
	"Nie wyswietlaj dodatkowych elementow zbroi",
	"Ukryj oryginalna zbroje i pokazuj tylko dodatkowe elementy",
	"Zawsze pokazuj dodatkowe elementy zbroi"
};

const string StExt_Str_Config_ArtifactReset = "(Przenoszenie punktow rozwoju.)";
const string StExt_Str_Config_Npc_SummonsCanHaveOwnSummons = "Przyzwane stworzenia moga miec wlasne przyzwania";
const string StExt_Str_Config_Npc_CantUseSpellAbilities = "Wylacz uzywanie umiejetnosci ataku przez NPC";
const string StExt_Str_Config_Npc_CantUseBuffAbilities = "Wylacz uzywanie blogoslawienstw przez NPC";
const string StExt_Str_Config_Npc_CantUseSummonAbilities = "Wylacz uzywanie przyzwan przez NPC";

const string StExt_Str_ExtraDamage = "Dodatkowe obrazenia";
const string StExt_Str_ExtraDamageFlag_Dot = "Okresowe";
const string StExt_Str_ExtraDamageFlag_Reflect = "Odbite";

const string StExt_Str_Config_DisableEnchantedItemsEffects = "Wylacz efekty wizualne na generowanych przedmiotach (wymaga restartu gry)";

const string StExt_Str_ExtraDamageType_String = "Typ obrazen";
const string StExt_Str_ExtraDamageType[21] =
{
	"Walka Wrecz",
	"Walka Dystansowa",
	"Zaklecie",
	"Zdolnosc",
	"Ogien",
	"Lod",
	"Elektrycznosc",
	"Powietrze",
	"Ziemia",
	"Swiatlo",
	"Mrok",
	"Smierc",
	"Zycie",
	"I",
	"Prawdziwy",
	"Krew",
	"Nieumarly",
	"Golem",
	"Demon",
	"Piesc",
	"Pulapka"
};

const string StExt_Str_ExtraDamageFlags_String = "Typ efektu";
const string StExt_Str_ExtraDamageFlags[28] =
{
    "Aura", // StExt_DamageFlag_Aura
    "DoT", // StExt_DamageFlag_Dot
    "Obszarowy", // StExt_DamageFlag_Aoe
    "Leczenie", // StExt_DamageFlag_Heal
    "Przyzwanie", // StExt_DamageFlag_Summon
    "Wsparcie", // StExt_DamageFlag_Support
    "Ciecie", // StExt_DamageFlag_Unlock
    "Mgnienie", // StExt_DamageFlag_Blink
    "Wzmocnienie", // StExt_DamageFlag_Buff
    "Oslabienie", // StExt_DamageFlag_Debuff
    "Efekt Czasowy", // StExt_DamageFlag_Timed
    "Przemiana", // StExt_DamageFlag_Transform
    "Golem", // StExt_DamageFlag_Golem
    "Demon", // StExt_DamageFlag_Demon
    "Nieumarly", // StExt_DamageFlag_Undead
    "Odbicie", // StExt_DamageFlag_Reflect
    "Czlowiek", // StExt_DamageFlag_Human
    "Mikstura", // StExt_DamageFlag_Potion
    "Ork", // StExt_DamageFlag_Orc
    "Zwierze", // StExt_DamageFlag_Animal
    "Cel", // StExt_DamageFlag_Target
    "Totem", // StExt_DamageFlag_Totem
    "Pojedynczy Cel", // StExt_DamageFlag_Single
    "Zamrozenie", // StExt_DamageFlag_Freeze
    "Ogluszenie", // StExt_DamageFlag_Stun
    "Korzenie", // StExt_DamageFlag_Roots
    "Atak Lancuchowy", // StExt_DamageFlag_Chain
	"Strumien" // StExt_DamageFlag_Stream
};

const string itrw_stext_stext_bow_l_name = "Prosty Luk";
const string itrw_stext_stext_bow_m_name = "Luk";
const string itrw_stext_stext_bow_h_name = "Luk Bojowy";

const string StExt_Str_DoCastAuras = "Automatyczne rzucanie aur";
const string StExt_Str_Corruption_BonusHeader = "Bonusy skazenia: ";
const string StExt_Str_Corruption_BonusStat[StExt_CorruptionBonus_Max] =
{
	"Sily zywotne (razem | na nastepnym poziomie): ",
	"Mana (razem | na nastepnym poziomie): ",
	"Inteligencja (razem | na nastepnym poziomie): ",
	"Sila (razem | na nastepnym poziomie): ",
	"Zrecznosc (razem | na nastepnym poziomie): ",
	"Unik (razem | na nastepnym poziomie): "
};

const string StExt_Str_Scrolmaking_No = "Nie spelniono wymagan!";

const string StExt_Str_SummonGhost_Name = "Przyzwany Duch";
const string StExt_Str_SummonBoneGolem_Name = "Przyzwany Kosciany Golem";
const string StExt_Str_SummonShadowbeast_Name = "Przyzwany Cieniostwor";
const string StExt_Str_SummonShadowbeast_Fire_Name = "Przyzwany Duch Ognia";
const string StExt_Str_Summon_Troll_Name = "Przyzwany Troll";
const string StExt_Str_SummonCrawler_Name = "Przyzwany Pelzacz";
const string StExt_Str_SummonOster_Name = "Przyzwany Glorhk";

const string StExt_Str_TalisanRunen_Crait = "Stworz rune przyzywajaca Kraita";
const string StExt_Str_TalisanRunen_SummonGhost = "Stworz rune przyzwania Ducha";
const string StExt_Str_TalisanRunen_SummonBoneGolem = "Stworz rune przyzwania Koscianego Golema";
const string StExt_Str_TalisanRunen_SummonShadowbeast = "Stworz rune przyzwania Cieniostwora";
const string StExt_Str_TalisanRunen_SummonShadowbeast_Fire = "Stworz rune przyzwania Ducha Ognia";
const string StExt_Str_TalisanRunen_Summon_Troll = "Stworz rune przyzwania Trolla";
const string StExt_Str_TalisanRunen_SummonCrawler = "Stworz rune przyzwania Pelzacza";
const string StExt_Str_TalisanRunen_SummonOster = "Stworz rune przyzwania Glorhka";

const string StExt_Str_TalisanRunen_Summon_Electricgolem = "Stworz rune przyzwania Eterycznego Golema";
const string StExt_Str_TalisanRunen_PoisionCape = "Stworz rune Egidy Trucizny";
const string StExt_Str_TalisanRunen_EarthCape = "Stworz rune Egidy Ziemi";
const string StExt_Str_TalisanRunen_AirCape = "Stworz rune Egidy Powietrza";
const string StExt_Str_TalisanRunen_DarkCape = "Stworz rune Egidy Mroku";
const string StExt_Str_TalisanRunen_LightingCape = "Stworz rune Egidy Pioruna";
const string StExt_Str_TalisanRunen_IceCape = "Stworz rune Egidy Lodu";
const string StExt_Str_TalisanRunen_FireCape = "Stworz rune Egidy Ognia";

const string StExt_Str_TalisanRunen_Buff_Protection = "Stworz rune Blogoslawienstwa - Ochrona";
const string StExt_Str_TalisanRunen_Buff_Hp = "Stworz rune Blogoslawienstwa - Witalnosc";
const string StExt_Str_TalisanRunen_Buff_Stats = "Stworz rune Blogoslawienstwa - Atrybuty";
const string StExt_Str_TalisanRunen_Buff_Regen = "Stworz rune Blogoslawienstwa - Regeneracja";
const string StExt_Str_TalisanRunen_Buff_Damage = "Stworz rune Blogoslawienstwa - Obrazenia";
const string StExt_Str_TalisanRunen_Buff_Speed = "Stworz rune Blogoslawienstwa - Szybkosc";
const string StExt_Str_TalisanRunen_Buff_Dodge = "Stworz rune Blogoslawienstwa - Unik";
const string StExt_Str_TalisanRunen_Buff_Es = "Stworz rune Blogoslawienstwa - Tarcza Energii";
const string StExt_Str_TalisanRunen_Buff_MassRestore = "Stworz rune Masowego Leczenia";

const string StExt_Str_TalisanRunen_Debuff_Protection = "Stworz rune Klatwy - Podatnosci";
const string StExt_Str_TalisanRunen_Debuff_Stats = "Stworz rune Klatwy - Oslabienie";
const string StExt_Str_TalisanRunen_Debuff_Siphon = "Stworz rune Klatwy - Wysysanie Zycia";
const string StExt_Str_TalisanRunen_Debuff_Speed = "Stworz rune Klatwy - Spowolnienie";
const string StExt_Str_TalisanRunen_Debuff_Lifetap = "Stworz rune Klatwy - Zatkanie Zycia";
const string StExt_Str_TalisanRunen_Debuff_ReflectDamage = "Stworz rune Klatwy - Zelazna Dziewica";
const string StExt_Str_TalisanRunen_Debuff_ExtraDamage = "Stworz rune Klatwy - Wiecej Obrazen";
const string StExt_Str_TalisanRunen_Debuff_Weaken = "Stworz rune Klatwy - Oslabienie Obrazen";

const string StExt_Str_Dia_SellBanditHead = "Glowa Bandyty.";
const string StExt_Str_StonedTrader_SellEnchanted = "(Sprzedaj zaczarowane przedmioty...)";
const string StExt_Str_StonedTrader_SellEnchanted_Weap = "Bron";
const string StExt_Str_StonedTrader_SellEnchanted_Armor = "Zbroja";
const string StExt_Str_StonedTrader_SellEnchanted_Jewelry = "Bizuteria";
const string StExt_Str_StonedTrader_IdentifyItems = "Identyfikuj przedmioty.";
const string StExt_Str_StonedTrader_IdentifyItems_ItmPrice = " cena za sztuke: ";
const string StExt_Str_StonedTrader_IdentifyItems_ItmPriceTotal = " Razem: ";
const string StExt_Str_IdentifiedItems = "Zidentyfikowane przedmioty: ";
const string StExt_Str_CorruptedPerkNotEnoughtLp = "Za malo punktow obrazen.";
const string StExt_Str_CorruptedPerk_DamagePoints = "Punkty Obrazen: ";
const string StExt_Str_CorruptedPerk_DamageExp = "Zadane Obrazenia: ";
const string StExt_Str_Menu_CorruptedTouch = "[Rozwin 'Dotyk Zepsucia']";
const string StExt_Str_Config_CorruptionTouchExp = "Mnoznik doswiadczenia zdobywanego przez talent 'Dotyk Zepsucia'";
const string StExt_Str_CorruptionTouchExp = "Zdobyte Doswiadczenie: ";
const string StExt_Str_Wasili_JunkTrade = "(Sprzedaj smieci)";
const string StExt_Str_Saghita_PotionSell = "(Sprzedaj mikstury)";

const string StExt_Str_SummonsCountGlobalStat = "Przyzwane Stworzenia:";

const string StExt_Str_Professions_Header = " -= Profesje =- ";

const string StExt_Str_Profession_Name[StExt_ProfessionIndex_Max] = 
{
	"Tworzenie Zwojow",
	"Warzenie Mikstur",
	"Zaklinanie"
};

const string StExt_Str_Profession_Skill_Scrollmaking_Name[StExt_ScrollmakingSkillIndex_Max] = 
{
	"Podstawowe Zwoje",
	"Zaawansowane Zwoje",
	"Mistrzowskie Zwoje",
	"Wydajny Skryba",
	"Zwoje Pirokinetyki",
	"Zwoje Kriomancji",
	"Zwoje Elektromancji",
	"Zwoje Aeromancji",
	"Zwoje Geomancji",
	"Zwoje Jasnej Magii",
	"Zwoje Mrocznej Magii",
	"Zwoje Magii Smierci",
	"Zwoje Magii Zycia",
	"Zwoje Tworzenia Golemow",
	"Zwoje Demonologii",
	"Zwoje Nekromancji"
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

const string StExt_Str_Menu_CorruptedTouch_Luck = "Rozwin Szczescie";
const string StExt_Str_Menu_CorruptedTouch_Aura = "Rozwin Aure";
const string StExt_Str_Menu_CorruptedTouch_Stats = "Rozwin Atrybuty";
const string StExt_Str_Menu_CorruptedTouch_Protection = "Rozwin Ochrone";
const string StExt_Str_Menu_CorruptedTouch_Damage = "Rozwin Obrazenia";
const string StExt_Str_Menu_CorruptedTouch_Masteries = "Rozwin Mistrzostwa";
const string StExt_Str_Menu_CorruptedTouch_Summons = "Rozwin Przyzwanie";

const string StExt_Str_Config_Diff_EnableRot_NightEncounters = "Wlacz Nocnych Najezdzcow z 'Drogi Prob'";
const string StExt_Str_Config_Diff_EnableRot_Avengers = "Wlacz Lowcow Nagrod z 'Drogi Prob'";
const string StExt_Str_Config_Diff_EnableRot_Bandits = "Wlacz Bandytow z 'Drogi Prob'";

const string StExt_Str_Config_ShowNpcFlags = "Wyswietlaj Flagi NPC";
const string StExt_Str_Config_ShowNpcRank = "Wyswietlaj Range NPC";
const string StExt_Str_Config_ShowNpcAbilities = "Wyswietlaj Zdolnosci NPC";


const string StExt_Str_DamageBlocked = "Obrazenia Zablokowane!";
const string StExt_Str_DamageBlocked_Dodge = "Unik";
const string StExt_Str_DamageBlocked_Ignored = "Zignorowane";
const string StExt_Str_DamageBlocked_ArrowDeclined = "Pocisk Odbity";
const string StExt_Str_DamageBlocked_SpellAbsorbed = "Zaklecie Pochloniete";
const string StExt_Str_DamageBlocked_SpellReflected = "Zaklecie Odbite";

const string StExt_Str_Config_HideHelm = "Ukryj Wyswietlanie Helmu";

const string StExt_Str_ForgetPerks = "Zapomnij Wyuczone Umiejetnosci";

const string StExt_Str_Bosper_MisslesSell = "(Sprzedaj magiczne strzaly, granaty i wiecej...)";
const string StExt_Str_Jora_MiskSell = "(Sprzedaj przedmioty gospodarstwa domowego)";
const string StExt_Str_Harad_CoalSell = "(Sprzedaj towar kowalski i materialy zuzywalne)";
const string StExt_Str_Kardif_FoodSell = "(Sprzedaj mieso i inne jedzenie)";
const string StExt_Str_Kardif_BoozeSell = "(Sprzedaj alkohol)";

const string StExt_Str_AcceptHelp = "<Potwierdz przeczytanie i ukryj podpowiedzi>";
const string StExt_Str_HelpStrings[8] = 
{
	"Witaj w modzie 'EthernalBreeze'",
	"[Glowny Klawisz] moda domyslnie [T] (chyba ze ustawiono inaczej)",
	"Nacisniecie [Glownego Klawisza] otworzy menu/okno dialogowe konfiguracji moda.",
	"Nacisniecie [Shift] + [Glowny Klawisz] otworzy dodatkowe menu statystyk postaci.",
	"Klawisz do aktywacji/dezaktywacji automatycznych aur domyslnie [O] (chyba ze ustawiono inaczej)",
	"Nacisniecie [Shift] + [O] otworzy graficzne menu konfiguracji moda.",
	"",
	"Aby ukryc to menu, otworz menu moda i potwierdz przeczytanie tej wiadomosci."
};

const string StExt_Str_Config_Npc_InfusionHpMult = "Modyfikator sil zywotnych magicznych NPC";
const string StExt_Str_Config_Npc_InfusionStatMult = "Modyfikator atrybutow magicznych NPC";
const string StExt_Str_Config_Npc_InfusionProtMult = "Modyfikator ochrony magicznych NPC";
const string StExt_Str_Config_Npc_InfusionDamMult = "Modyfikator obrazen magicznych NPC";
const string StExt_Str_Config_Npc_InfusionEsMult = "Modyfikator tarczy energii magicznych NPC";

const string StExt_Str_NewVersionMigrateNotify = "Aktualizacja moda 'EthernalBreeze'";
const string StExt_Str_Absent = "Nieobecny ";

const string StExt_Str_ModMenu_ItemGeneratorPresetsSection = "Wczytaj ustawienia generatora przedmiotow...";
const string StExt_Str_ModMenu_DefaultItemGeneratorPreset = "Domyslne ustawienia generatora przedmiotow";

const string StExt_Str_UserConfigsFuncNotFound = "Nie znaleziono funkcji zestawu ustawien!";
const string StExt_Str_ModMenu_ExportCurrentConfigs = "Eksportuj obecne ustawienia... (bedzie dostepne po ponownym wejsciu do gry)";
const string StExt_Str_ExportCurrentConfigs_Failed = "Nie udalo sie wyeksportowac obecnych ustawien!";

const string StExt_Str_StonedTrader_OpenChests = "(Otworz wszystkie nazwane skrzynie)";
const string StExt_Str_StonedTrader_OpenChests_Open = "Otwarte Skrzynie: ";
const string StExt_Str_StonedTrader_OpenChests_Nothing = "Brak Skrzyn!";

const string StExt_Str_Dragomir_CBowSell = "(Sprzedaj kusze za 25% ich wartosci)";
const string StExt_Str_Matteo_JewSell = "(Sprzedaj bizuterie za 25% jej wartosci)";

const string StExt_Str_GiveRhit_Rhit = "Retoryka + ";
const string StExt_Str_GiveRhit_Total = " (Razem: ";

const string StExt_Str_ChoiceSidWeap_Bow = "(Luk)";
const string StExt_Str_ChoiceSidWeap_Magic = "(Magia)";

const string itar_stext_godarmor_name = "Zbroja Wybranca";

const string StExt_Str_AverageWeapDamageInfo_Meele = "Oczekiwane Obrazenia Wrecz: ";
const string StExt_Str_AverageWeapDamageInfo_Range = "Oczekiwane Obrazenia Dystansowe: ";
const string StExt_Str_AverageWeapDamageInfo_Magic = "Oczekiwane Obrazenia Run: ";

const string StExt_Str_Config_DamageReductionExpRate = "Mnoznik doswiadczenia zdobywanego przez umiejetnosci ze zredukowanych obrazen";
const string StExt_Str_RodBeatenLogEntry_Fix = "Pokonalem Roda. Teraz nie musze udowadniac swojej sily, podnoszac jego miecz.";

const string StExt_Str_Config_Npc_MagicInfusion_HumansExtraChance = "Dodatkowa szansa magicznego nasycenia dla ludzi";
const string StExt_Str_Config_Npc_MagicInfusion_BossesExtraChance = "Dodatkowa szansa magicznego nasycenia dla bossow";

const string StExt_Str_CorruptionLevelUpMsg = "Skazenie postepuje...";

const string StExt_Str_Config_MasteryExpMult_Fire = "Mnoznik doswiadczenia dla mistrzostwa 'Pirokinetyka'";
const string StExt_Str_Config_MasteryExpMult_Ice = "Mnoznik doswiadczenia dla mistrzostwa 'Hydromancja'";
const string StExt_Str_Config_MasteryExpMult_Electric = "Mnoznik doswiadczenia dla mistrzostwa 'Elektromancja'";
const string StExt_Str_Config_MasteryExpMult_Air = "Mnoznik doswiadczenia dla mistrzostwa 'Aeromancja'";
const string StExt_Str_Config_MasteryExpMult_Earth = "Mnoznik doswiadczenia dla mistrzostwa 'Geomancja'";
const string StExt_Str_Config_MasteryExpMult_Light = "Mnoznik doswiadczenia dla mistrzostwa 'Jasna Magia'";
const string StExt_Str_Config_MasteryExpMult_Dark = "Mnoznik doswiadczenia dla mistrzostwa 'Mroczna Magia'";
const string StExt_Str_Config_MasteryExpMult_Death = "Mnoznik doswiadczenia dla mistrzostwa 'Magia Smierci'";
const string StExt_Str_Config_MasteryExpMult_Life = "Mnoznik doswiadczenia dla mistrzostwa 'Magia Zycia'";
const string StExt_Str_Config_MasteryExpMult_Golem = "Mnoznik doswiadczenia dla mistrzostwa 'Tworzenie Golemow'";
const string StExt_Str_Config_MasteryExpMult_Demon = "Mnoznik doswiadczenia dla mistrzostwa 'Demonologia'";
const string StExt_Str_Config_MasteryExpMult_Necro = "Mnoznik doswiadczenia dla mistrzostwa 'Nekromancja'";
const string StExt_Str_Config_MasteryExpMult_Shaman = "Mnoznik doswiadczenia dla mistrzostwa 'Magia Ducha'";
const string StExt_Str_Config_MasteryExpMult_MartialArts = "Mnoznik doswiadczenia dla mistrzostwa 'Sztuka Wojny'";
const string StExt_Str_Config_MasteryExpMult_Agile = "Mnoznik doswiadczenia dla mistrzostwa 'Sztuka Obrony'";
const string StExt_Str_Config_MasteryExpMult_Archery = "Mnoznik doswiadczenia dla mistrzostwa 'Sztuka Lucznictwa'";
const string StExt_Str_Config_MasteryExpMult_Blood = "Mnoznik doswiadczenia dla mistrzostwa '???'";
const string StExt_Str_Config_MasteryExpMult_FistFight = "Mnoznik doswiadczenia dla mistrzostwa '???'";
const string StExt_Str_Config_MasteryExpMult_Aura = "Mnoznik doswiadczenia dla mistrzostwa '???'";
const string StExt_Str_Config_MasteryExpMult_Traps = "Mnoznik doswiadczenia dla mistrzostwa '???'";
const string StExt_Str_Config_MasteryExpMult_Poision = "Mnoznik doswiadczenia dla mistrzostwa '???'";

const string StExt_Str_Config_EnableWorldRandomization_ByTimeEvents = "Wlacz losowosc swiata z wydarzen czasowych";


//------------------------------------------------------------------------
//							 Build 7.0.0
//------------------------------------------------------------------------

const string StExt_Str_itpo_damageup_01_Desc = "Zwieksza obrazenia w walce wrecz o 10%";
const string StExt_Str_itpo_damageup_02_Desc = "Zwieksza obrazenia w walce wrecz o 20%";
const string StExt_Str_itpo_damageup_03_Desc = "Zwieksza obrazenia w walce wrecz o 30%";
const string StExt_Str_itpo_damageup_Time_Desc = "Czas trwania efektu: 10 minut";

const string StExt_Str_ItemSpecialDamage = "Specjalne Obrazenia: ";
const string StExt_Str_ItemSpecialProtection = "Specjalna Ochrona: ";

const string StExt_Str_Config_MenuPauseOnShow = "Pauza przy otwartym menu (mod)";
const string StExt_Str_Config_MenuScrollMult = "Mnoznik sily przewijania menu (mod)";

const string StExt_Str_ExtraStaminaBonus_Toatal = " (Razem: ";

const string StExt_Str_ItPo_Concentration_Proto = "Mikstura Koncentracji";
const string StExt_Str_ItPo_Concentration_01 = "Mala Mikstura Koncentracji";
const string StExt_Str_ItPo_Concentration_02 = "Mikstura Koncentracji";
const string StExt_Str_ItPo_Concentration_03 = "Potezna Mikstura Koncentracji";

const string StExt_Str_ItPo_Concentration_Desc = "Tymczasowo zwieksza percepcje i szybkosc reakcji.";
const string StExt_Str_ItPo_Concentration_Power = "Sila Efektu (%):";

const string StExt_Str_ModMenu_ConsumePerm = "[Uzyj wszystkich bonusowych mikstur/jedzenia...]";
const string StExt_Str_Dia_ConsumePerm = "Uzyj '";

const string StExt_Str_On = "Wl.";
const string StExt_Str_Off = "Wyl.";

const string StExt_Str_Config_Category_Name[7] =
{
	"Trudnosc",
	"NPC",
	"Szczescie",
	"Losowosc",
	"Doswiadczenie",	
	"Interfejs",
	"Rozne"
};
const string StExt_ConfigsMenu_TabName[2] = 
{
	"Ustawienia",
	"Informacja"
};

const string StExt_Str_Menu_CraftButtonText = "Tworz";
const string StExt_Str_Menu_CraftType_TabText_All = "Wszystko";
const string StExt_Str_Menu_CraftType_TabsText[StExt_ReceiptType_Max] = 
{
	"Rozne",
	"Zbroja",
	"Bron do Walki Wrecz",
	"Bron do Walki Wrecz",
	"Bizuteria",
	"Magia"
};

const string StExt_Str_Config_Alch_DisplayOnScreen = "Wyswietlaj bonusy alchemiczne na ekranie";
const string StExt_Str_Config_Alch_PosX = "Pozycja pozioma bonusow alchemicznych";
const string StExt_Str_Config_Alch_PosY = "Pozycja pionowa bonusow alchemicznych";
const string StExt_Str_Config_Artifact_DisplayOnScreen = "Wyswietlaj informacje o artefakcie na ekranie";
const string StExt_Str_Config_Artifact_PosX = "Pozycja pozioma informacji o artefakcie";
const string StExt_Str_Config_Artifact_PosY = "Pozycja pionowa informacji o artefakcie";
const string StExt_Str_Config_Aura_DisplayOnScreen = "Wyswietlaj aktywne aury na ekranie";
const string StExt_Str_Config_Aura_PosX = "Pozycja pozioma aktywnych aur";
const string StExt_Str_Config_Aura_PosY = "Pozycja pionowa aktywnych aur";
const string StExt_Str_Config_EsBar_DefaultPos = "Wyswietlaj tarcze energii w domyslnej pozycji";
const string StExt_Str_Config_EsBar_PosX = "Pozycja pozioma tarczy energii";
const string StExt_Str_Config_EsBar_PosY = "Pozycja pionowa tarczy energii";
const string StExt_Str_Config_ItemMenu_PosX = "Pozycja pozioma informacji o przedmiocie";
const string StExt_Str_Config_ItemMenu_PosY = "Pozycja pionowa informacji o przedmiocie";
const string StExt_Str_Config_MsgTray_PosX = "Pozycja pozioma dziennika wiadomosci";
const string StExt_Str_Config_MsgTray_PosY = "Pozycja pionowa dziennika wiadomosci";
const string StExt_Str_Config_EnableFemaleSkin = "Wlacz skore zenska";
const string StExt_Str_Config_EnableFemaleSkin_AlwaysWig = "Wlacz skore zenska - dodaj peruke";
const string StExt_Str_Config_EnableFemaleSkin_DemonLook = "Wlacz skore zenska - wyglad demoniczny";


const string StExt_Str_ItemPreffixName[299] = 
{
	"Kolczasty",
    "Lsniacy",
    "Plonacy",
    "Krzepki",
    "Wzmocniony",
    "Skandaliczny",
    "Monumentalny",
    "Podziemny",
    "Mysliwski",
    "Wybrany",
    "Rozpetany",
    "Niszczycielski",
    "Zebrowany",
    "Lazurowy",
    "Pulchny",
    "Niezdatny",
    "Ohydny",
    "Niewidzialny",
    "Noc",
    "Zgnily",
    "Pokonany",
    "Genialny",
    "Robaczywy",
    "Niewidzialny",
    "Zniedoleznialy",
    "Zepsuty",
    "Trupi",
    "Ozywiajacy",
    "Podgrzany",
    "Napiety",
    "Kuszacy",
    "Oczyszczajacy",
    "Przerazajacy",
    "Zweglony",
    "Obcy",
    "Szepczacy",
    "Trzesacy sie",
    "Zlowieszczy",
    "Alchemiczny",
    "Bogaty",
    "Burzowy",
    "Wyuzdany",
    "Wieczny",
    "Winny",
    "Zaniepokojony",
    "Gipsowy",
    "Grzeszny",
    "Dalekowzroczny",
    "Amatorski",
    "Dolomitowy",
    "Odurzajacy",
    "Sfermentowany",
    "Zageszczony",
    "Obfity",
    "Wykwintny",
    "Wystraszony",
    "Testowy",
    "Wysuszajacy",
    "Wrzacy",
    "Kliniczny",
    "Laboratoryjny",
    "Masochistyczny",
    "Metny",
    "Obfity",
    "Ostrozny",
    "Niebezpieczny",
    "Oprozniajacy",
    "Doswiadczony",
    "Oslabiajacy",
    "Roztropny",
    "Ostrozny",
    "Gotowany",
    "Ogluszony",
    "Ogluszony",
    "Panikujacy",
    "Pienisty",
    "Pozywny",
    "Przygotowany",
    "Poreczny",
    "Zlowrogi",
    "Przestepczy",
    "Rozkladajacy sie",
    "Prymitywny",
    "Samobiczujacy sie",
    "Skapy",
    "Tepy",
    "Skapy",
    "Chlodny",
    "Wiednacy",
    "Chemiczny",
    "Musujacy",
    "Hojny",
    "Eksperymentalny",
    "Nieokielznany",
    "Pomalowany",
    "Brudny",
    "Czysty",
    "Umyty",
    "Wypolerowany",
    "Zapchany",
    "Szorstki",
    "Zardzewialy",
    "Zepsuty",
    "Przebiegly",
    "Obrzydliwy",
    "Marudny",
    "Wyswiechtany",
    "Skrecony",
    "Splatany",
    "Zlosliwy",
    "Demoniczny",
    "Boski",
    "Nieprzyzwoity",
    "Zabity",
    "Wskrzeszony",
    "Ukrzyzowany",
    "Ozywiony",
    "Zagubiony",
    "Brodaty",
    "Lysy",
    "Nudny",
    "Interesujacy",
    "Intensywny",
    "Pobity",
    "Sluzowaty",
    "Lepki",
    "Sliski",
    "Zdretwialy",
    "Milczacy",
    "Elastyczny",
    "Miekki",
    "Sztywny",
    "Zasmarkany",
    "Odpychajacy",
    "Ciezki",
    "Martwy",
    "Mglisty",
    "Potworny",
    "Krwawy",
    "Hartowany",
    "Goracy",
    "Trujacy",
    "Osmalony",
    "Kamien",
    "Zloty",
    "Srebrny",
    "Brazowy",
    "Zelazny",
    "Miedziany",
    "Marmurowy",
    "Zwietrzaly",
    "Rytual",
    "Zaczarowany",
    "Przeklety",
    "Widmowy",
    "Magiczny",
    "Czarujacy",
    "Starozytny",
    "Mityczny",
    "Swiety",
    "Blogoslawiony",
    "Cuchnacy",
    "Smiercionosny",
    "Mrozacy",
    "Prazacy",
    "Zniszczony",
    "Zdewastowany",
    "Jalowy",
    "Zyzny",
    "Udreczony",
    "Wyczerpany",
    "Potezny",
    "Niezniszczalny",
    "Niezdobyty",
    "Czujny",
    "Zapomniany",
    "Znikajacy",
    "Zreczny",
    "Oszpecony",
    "Napromieniowany",
    "Jarzacy sie",
    "Wrogi",
    "Wielki",
    "Uroczy",
    "Zepsuty",
    "Straszny",
    "Zbutwialy",
    "Rozkuty",
    "Grozny",
    "Czczony",
    "Wybrany",
    "Rozgoryczony",
    "Upadly",
    "Zagubiony",
    "Zagubiony",
    "Zapomniany",
    "Zamkniety",
    "Zablokowany",
    "Uwieziony",
    "Oslepiajacy",
    "Grzmiacy",
    "Burzowy",
    "Uziemiony",
    "Nieudany",
    "Zatopiony",
    "Wskrzeszony",
    "Zepsuty",
    "Gigantyczny",
    "Nadprzyrodzony",
    "Tajemniczy",
    "Zaplatany",
    "Enigmatyczny",
    "Sekretny",
    "Urzekajacy",
    "Nieziemski",
    "Ozywczy",
    "Ponury",
    "Mroczny",
    "Magnetyczny",
    "Psychiczny",
    "Telepatyczny",
    "Paranormalny",
    "Hipnotyczny",
    "Medialny",
    "Nieznane",
    "Niewidzialny",
    "Nieuchwytny",
    "Niezidentyfikowany",
    "Niezglebiony",
    "Bezksztaltny",
    "Nieskonczony",
    "Bezgraniczny",
    "Bezkresny",
    "Niepojety",
    "Niezapomniany",
    "Niesamowity",
    "Fantastyczny",
    "Wspanialy",
    "Kolosalny",
    "Gigantyczny",
    "Tytaniczny",
    "Niezmierzony",
    "Wielkoskalowy",
    "Epicki",
    "Legendarny",
    "Heroiczny",
    "Dzielny",
    "Waleczny",
    "Majestatyczny",
    "Szlachetny",
    "Dumny",
    "Madry",
    "Sprytny",
    "Intelektualny",
    "Geniusz",
    "Sprytny",
    "Smialy",
    "Odwazny",
    "Chlodnokrwisty",
    "Zdeterminowany",
    "Niewzruszony",
    "Nieustraszony",
    "Niestrudzony",
    "Niezmordowany",
    "Nienasycony",
    "Spragniony",
    "Spalenie",
    "Niepowstrzymany",
    "Nieublagany",
    "Niespokojny",
    "Nieugiety",
    "Nieprzejednany",
    "Niepokonany",
    "Nieodparty",
    "Niepokonalny",
    "Niedokonczony",
    "Niewykonalny",
    "Nieprzepuszczalny",
    "Nieprzebyty",
    "Nieosiagalny",
    "Nietykalny",
    "Niewzruszony",
    "Niezmieniony",
    "Nieunikniony",
    "Niewiarygodny",
    "Niewierny",
    "Niestaly",
    "Niepoprawny",
    "Wadliwy",
    "Niepozazdroszczenia godny",
    "Niewybaczalny",
    "Nieodwracalny",
    "Niezlomny",
    "Niewzruszony",
    "Nieugaszony",
    "Nieopisany",
    "Niewytlumaczalny",
    "Niewytlumaczalny",
    "Niezglebiony"
};

const string StExt_Str_ItemAffixName[407] = 
{
    "Bestia",
    "Lotr",
    "Otchlan",
    "Ogar",
    "Nieboszczyk",
    "Karaluch",
    "Goliat",
    "Ichtiander",
    "Bekart",
    "Geniusz",
    "Ghul",
    "Slepiec",
    "Wloczega",
    "Kruk",
    "Demon",
    "Golem",
    "Rozklad",
    "Zwloki",
    "Wisielec",
    "Chochlik",
    "Lis",
    "Zebrak",
    "Poszukiwacz",
    "Przyzywacz",
    "Skorpion",
    "Foka",
    "Topielec",
    "Cep",
    "Duch",
    "Wiatr",
    "Potwor",
    "Ropa",
    "Szkielet",
    "Widmo",
    "Kowal",
    "Dziwolag",
    "Kaznik",
    "Zloczynca",
    "Pasterz",
    "Mistrz",
    "Elf",
    "Pozeracz Umyslow",
    "Kanibal",
    "Ludojad",
    "Konstrukt",
    "Owoc",
    "Wychowanek",
    "Kolos",
    "Zlodziej",
    "Skrytobojca",
    "Rozpruwacz",
    "Bohater",
    "Kot",
    "Archaniol",
    "Wladca",
    "Nietoperz",
    "Wir Wodny",
    "Alchemik",
    "Lowca",
    "Karczmarz",
    "Zuk",
    "Robak",
    "Robak Pasozytniczy",
    "Pasozyt",
    "Mag",
    "Uczony",
    "Oko",
    "Diabel",
    "Kat",
    "Baranek",
    "Akolita",
    "Robactwo",
    "Smok",
    "Monarcha",
    "Krol",
    "Wladca",
    "Szumowina",
    "Urwis",
    "Pijak",
    "Kultysta",
    "Mechanizm",
    "Papuga",
    "Len",
    "Slubowanie",
    "Obiad",
    "Wampir",
    "Koza",
    "Sniadanie",
    "Dolegliwosc",
    "Skrzydlo",
    "Calun",
    "Popiol",
    "Pelzacz",
    "Pajak",
    "Wilk",
    "Walizka",
    "Eliksir",
    "Trucizna",
    "Skrawek",
    "Bryla",
    "Lapec",
    "Tarcza",
    "Miecz",
    "Luk",
    "Topor",
    "Kij",
    "Sztylecik",
    "Chochla",
    "Warzywo Korzeniowe",
    "Puch",
    "Psychol",
    "Niewolnik",
    "Lisc",
    "Pieniek",
    "Napoj",
    "Lew",
    "Golab",
    "Wrzod",
    "Ciecie",
    "Wysilek",
    "Naciecie",
    "Mlot",
    "Kucyk",
    "Szkodnik",
    "Rumak",
    "Smierdziel",
    "Zab",
    "Kiel",
    "Muritan",
    "Baran",
    "Baran",
    "Dzik",
    "Kamerdyner",
    "Mistrz",
    "Uczen",
    "Wychowanek",
    "Zlosliwy",
    "Krab",
    "Noz",
    "Kucharz",
    "Porazka",
    "Cmentarzysko",
    "Dywan",
    "Zaslona",
    "Kupiec",
    "Starzec",
    "Dziadek",
    "Rzeznik",
    "Straznik",
    "Paladyn",
    "Guru",
    "Pan",
    "Piechur",
    "Lucznik",
    "Promien",
    "Kwadrat",
    "Sfera",
    "Ogien",
    "Nosiciel",
    "Ladowacz",
    "Sluga",
    "Milosnik Bestii",
    "Heretyk",
    "Renegat",
    "Zupa",
    "Bobr",
    "Strumien",
    "Aptekarz",
    "Kominiarz",
    "Murarz",
    "Sad",
    "Czapka",
    "Zamiec",
    "Spokoj",
    "Piesc",
    "Zniwiarz",
    "Barbarzynca",
    "Podkomorzy",
    "Szczurolap",
    "Zwierciadlo",
    "Szklo",
    "Szata",
    "Latarnia",
    "Nawoz",
    "Kamien",
    "Dab",
    "Jesion",
    "Lod",
    "Wyladowanie",
    "Sztylet",
    "Marmurowy",
    "Szabla",
    "Sierp",
    "Brzytwa",
    "Skalpel",
    "Swiatlo",
    "Mrok",
    "Tornado",
    "Giez",
    "Proch",
    "Chmura",
    "Deszcz",
    "Burza",
    "Nawalnica",
    "Blyskawica",
    "Grzmot",
    "Mgla",
    "Mrok",
    "Blysk",
    "Swit",
    "Zachod",
    "Wschod Slonca",
    "Bagiennik",
    "Lesnik",
    "Grzyb",
    "Korzen",
    "Galaz",
    "Owoc",
    "Woda",
    "Rzeka",
    "Staw",
    "Jezioro",
    "Ocean",
    "Laguna",
    "Brzeg",
    "Port",
    "Przyplyw",
    "Odplyw",
    "Fala",
    "Piana",
    "Rafa",
    "Koral",
    "Wieloryb",
    "Rekin",
    "Ryba",
    "Osmiornica",
    "Kalamarnica",
    "Marynarz",
    "Kapitan",
    "Admiral",
    "Pirat",
    "Filibustier",
    "Korsarz",
    "Bryg",
    "Fregata",
    "Statek",
    "Szkuner",
    "Jacht",
    "Tratwa",
    "Lodz",
    "Kajak",
    "Kajak",
    "Kuter",
    "Silnik",
    "Wioslo",
    "Kotwica",
    "Zagiel",
    "Ster",
    "Maszt",
    "Wir",
    "Galera",
    "Powoz",
    "Zaloga",
    "Furgon",
    "Woz",
    "Sanie",
    "Kolo",
    "Os",
    "Pedal",
    "Paliwo",
    "Gwiazda",
    "Planeta",
    "Meteor",
    "Asteroida",
    "Kometa",
    "Satelita",
    "Kosmos",
    "Galaktyka",
    "Wszechswiat",
    "Swiat",
    "Cywilizacja",
    "Epoka",
    "Era",
    "Wiek",
    "Rok",
    "Miesiac",
    "Tydzien",
    "Dzien",
    "Godzina",
    "Minuta",
    "Sekunda",
    "Chwila",
    "Iskra Swiatla",
    "Iskierka",
    "Plomien",
    "Wegiel",
    "Kupka Popiolu",
    "Garsc",
    "Drzazga",
    "Odlamek",
    "Kropla",
    "Zelazny",
    "Srebrny",
    "Zloto",
    "Platyna",
    "Cyna",
    "Miedziany",
    "Aluminium",
    "Tytan",
    "Rtec",
    "Krzemien",
    "Fosfor",
    "Magnez",
    "Wegiel",
    "Tlen",
    "Azot",
    "Wodor",
    "Hel",
    "Argon",
    "Neon",
    "Ksenon",
    "Radon",
    "Polon",
    "Tor",
    "Uran",
    "Pluton",
    "Zmija",
    "Waz",
    "Kobra",
    "Anakonda",
    "Zaskroniec",
    "Jaszczur",
    "Krokodyl",
    "Aligator",
    "Zolw",
    "Mrowka",
    "Pszczola",
    "Osa",
    "Trzmiel",
    "Komar",
    "Mucha",
    "Szarancza",
    "Motyl",
    "Konik Polny",
    "Gasienica",
    "Mszyca",
    "Pijawka",
    "Meduza",
    "Krewetka",
    "Homar",
    "Rak",
    "Ostryga",
    "Malz",
    "Przegrzebek",
    "Slimak Morski",
    "Delfin",
    "Orka",
    "Mors",
    "Slon",
    "Zyrafa",
    "Nosorozec",
    "Hipopotam",
    "Zebra",
    "Gazela",
    "Antylopa",
    "Bawol",
    "Lisica",
    "Niedzwiedz",
    "Borsuk",
    "Wydra",
    "Norka",
    "Swistak",
    "Szop",
    "Jelen",
    "Los",
    "Sarna",
    "Polnoc",
    "Poludnie",
    "Zachod",
    "Wschod",
    "Kompas",
    "Magnes",
    "Igla",
    "Nic",
    "Tkanina",
    "Len",
    "Jedwab",
    "Bawelna",
    "Welna",
    "Futro",
    "Skora",
    "Zamsz",
    "Aksamit",
    "Satyna",
    "Brokat",
    "Dzins",
    "Serz",
    "Guzik",
    "Zapinka",
    "Sznur",
    "Szpilka",
    "Haczyk",
    "Naparstek",
    "Lapa",
    "But",
    "But",
    "Trzewik"
};

const string StExt_Str_ItemSuffixName[363] = 
{
    "Salamandra",
    "Szkwal",
    "Bogowie",
    "Starszy",
    "Formacja",
    "Loch",
    "Odkupienie",
    "Robak",
    "Jaszczur",
    "Rozkosz",
    "Rozlanie",
    "Wygnanie",
    "Foka",
    "Chmura",
    "Skandal",
    "Kombatant",
    "Wir",
    "Troll",
    "Diabelstwo",
    "Ohyda",
    "Zgnilizna",
    "Zguba",
    "Odkrycie",
    "Zawodzacy",
    "Plugastwo",
    "Cierpienie",
    "Fatalnosc",
    "Rozwoj",
    "Pilnosc",
    "Furia",
    "Utrata Krwi",
    "Zaklinanie",
    "Zakon",
    "Schronienie",
    "Potwor",
    "Zranienie",
    "Entropia",
    "Przebiegly",
    "Proroctwo",
    "Odparcie",
    "Wydajnosc",
    "Zniszczenie",
    "Odpornosc",
    "Bitwa",
    "Zawal",
    "Mistyk",
    "Duch",
    "Runy",
    "Trening",
    "Fanatyzm",
    "Zabezpieczenie",
    "Zolc",
    "Milosierdzie",
    "Albatros",
    "Bieluga",
    "Ciaglosc",
    "Rzez",
    "Bagienny Mech",
    "Pchla",
    "Pancernik",
    "Nawalnik",
    "Czarodziej",
    "Wysysanie",
    "Golab",
    "Dobrobyt",
    "Jez",
    "Sztywnosc",
    "Barykada",
    "Zaklinacz",
    "Zatkanie",
    "Zamkniecie",
    "Zanikanie",
    "Leczenie",
    "Izolacja",
    "Karp",
    "Czarnoksieznik",
    "Krysztal",
    "Rozlew Krwi",
    "Upuszczanie Krwi",
    "Nekromanta",
    "Wychowanek",
    "Obfitosc",
    "Ulga",
    "Ograniczenie",
    "Oprozniajacy",
    "Wyzwolenie",
    "Osuszanie",
    "Osa",
    "Odwrocenie",
    "Napinanie",
    "Wyparcie",
    "Wtajemniczony",
    "Akolita",
    "Stalosc",
    "Przeszkoda",
    "Pryzmat",
    "Zadanie",
    "Przeciwwaga",
    "Plonace Runy",
    "Teczowy",
    "Odwet",
    "Masakra",
    "Opanowanie",
    "Skunks",
    "Sluga",
    "Zmiekczenie",
    "Kontakt",
    "Spokoj",
    "Stabilizacja",
    "Surowosc",
    "Zwilzanie",
    "Wytrwalosc",
    "Upor",
    "Pacyfikacja",
    "Sytosc",
    "Uczen",
    "Czarnoksieznik",
    "Hojnosc",
    "Trzmiel",
    "Nienawisc",
    "Xardas",
    "Vatras",
    "Pyrokar",
    "Pokoj",
    "Myrtana",
    "Uduszenie",
    "Strata",
    "Koniec",
    "Bloto",
    "Andre",
    "Constantino",
    "Harad",
    "Matteo",
    "Bosper",
    "Thorben",
    "Ignaz",
    "Zuris",
    "Szalenstwo",
    "Choroba",
    "Bol",
    "Podly",
    "Agonia",
    "Powietrze",
    "Kabala",
    "Mozg",
    "Czaszka",
    "Kosci",
    "Serce",
    "Nowosc",
    "Cisza",
    "Cisza",
    "Mrok",
    "Pustka",
    "Mrok",
    "Swiatlo",
    "Cien",
    "Glebiny",
    "Noc",
    "Gwiazdy",
    "Ksiezyc",
    "Slonce",
    "Popiol",
    "Pyl",
    "Szron",
    "Mroz",
    "Lod",
    "Snieg",
    "Chlod",
    "Burza",
    "Wir",
    "Wiatr",
    "Podmuch",
    "Grzmot",
    "Blyskawica",
    "Nawalnica",
    "Golem",
    "Zywiolowy",
    "Tytan",
    "Olbrzym",
    "Smok",
    "Wilk",
    "Tygrys",
    "Lew",
    "Lampart",
    "Niedzwiedz",
    "Wilkolak",
    "Feniks",
    "Gargulec",
    "Banshee",
    "Wampir",
    "Licz",
    "Szkielet",
    "Duch",
    "Demon",
    "Aniol",
    "Archaniol",
    "Bog",
    "Pan",
    "Cesarz",
    "Krol",
    "Ksiaze",
    "Despota",
    "Wladca",
    "Monarcha",
    "Mag",
    "Paladyn",
    "Krzyzowiec",
    "Templariusz",
    "Wojownik",
    "Rycerz",
    "Samuraj",
    "Ninja",
    "Skrytobojca",
    "Szpieg",
    "Mistrz",
    "Nauczyciel",
    "Adept",
    "Nowicjusz",
    "Wtajemniczony",
    "Gladiator",
    "Wojak",
    "Obronca",
    "Tarcza",
    "Miecz",
    "Topor",
    "Wlocznia",
    "Mlot",
    "Kusza",
    "Luk",
    "Sztylet",
    "Ostrze",
    "Berdysz",
    "Bulawa",
    "Kij",
    "Rozdzka",
    "Ksiega",
    "Manuskrypt",
    "Tom",
    "Zwoj",
    "Zaklecie",
    "Mikstura",
    "Eliksir",
    "Wywar",
    "Ziola",
    "Grzyby",
    "Korzenie",
    "Kwiaty",
    "Nasiona",
    "Gaj",
    "Las",
    "Pustynia",
    "Oaza",
    "Wulkan",
    "Rzeka",
    "Jezioro",
    "Morze",
    "Ocean",
    "Bagno",
    "Bagno",
    "Laguna",
    "Atlantyda",
    "Walhalla",
    "Eden",
    "Raj",
    "Sale",
    "Zamek",
    "Palac",
    "Twierdza",
    "Cytadela",
    "Bastion",
    "Wieza",
    "Skala",
    "Gora",
    "Szczyt",
    "Klif",
    "Otchlan",
    "Urwisko",
    "Rozpacz",
    "Upadek",
    "Zguba",
    "Los",
    "Karma",
    "Kara",
    "Rozliczenie",
    "Smutek",
    "Lzy",
    "Melancholia",
    "Litosc",
    "Gniew",
    "Wscieklosc",
    "Zlosliwosc",
    "Zemsta",
    "Odwet",
    "Zgroza",
    "Strach",
    "Podziw",
    "Lek",
    "Oczekiwanie",
    "Nadzieja",
    "Marzenie",
    "Pragnienie",
    "Wola",
    "Moc",
    "Moc",
    "Wielkosc",
    "Szlachetnosc",
    "Honor",
    "Chwala",
    "Mestwo",
    "Hart Ducha",
    "Odwaga",
    "Odwaga",
    "Determinacja",
    "Wytrzymalosc",
    "Cierpliwosc",
    "Niezlomnosc",
    "Nieugietosc",
    "Skupienie",
    "Madrosc",
    "Wiedza",
    "Oswiecenie",
    "Wglad",
    "Intuicja",
    "Objawienie",
    "Jasnosc",
    "Czystosc",
    "Dziewictwo",
    "Niewinnosc",
    "Tajemnica",
    "Magia",
    "Cuda",
    "Boskosc",
    "Sprawiedliwosc",
    "Osad",
    "Prawo",
    "Harmonia",
    "Rownowaga",
    "Prawda",
    "Dobro",
    "Zly",
    "Mrok",
    "Chaos",
    "Zniszczenie",
    "Stworzenie",
    "Byt",
    "Esencja",
    "Zywiol",
    "Natura",
    "Wszechswiat",
    "Kosmos",
    "Galaktyka",
    "Tunel Czasoprzestrzenny",
    "Anomalia",
    "Kataklizm",
    "Apokalipsa",
    "Armageddon",
    "Dzien Sadu",
    "Koniec Swiata",
    "Odrodzenie",
    "Renesans",
    "Przebudzenie",
    "Zmartwychwstanie",
    "Iluminacja"
};

const string StExt_Str_ItemSpecialName[2] = 
{
	"", ""
};

// 7.0.5
const string StExt_Str_Npc_Ability_Name[StExt_Npc_Ability_Index_Max] =
{
	"???",
	"Swieta Strzala",
	"Lodowa Strzala",
	"Mniejszy Piorun",
	"Strzala Smierci",
	"Widmowa Strzala",
	"Ognista Strzala",
	"Mroczna Strzala",
	"Kula Ognia",
	"Slaba Klatwa Mroku",
	"Srednia Klatwa Mroku",
	"Lodowa Lanca",
	"Kula Energii",
	"Mgnienie",
	"Rzuca Strzala",
	"Rzuca Beltem",
	"Rzuca Wybuchowym Beltem",
	"Rzuca Miazdzacym Beltem",
	"Rzuca Ostrym Beltem",
	"Rzuca Beltem Przeciwpancernym",
	"Rzuca Swietym Beltem",
	"Rzuca Magicznym Beltem",
	"Rzuca Wybuchowa Strzala",
	"Rzuca Magiczna Strzala",
	"Rzuca Ognista Strzala",
	"Rzuca Swieta Strzala",
	"Rzuca Zatruta Strzala",
	"Rzuca Kamieniem",
	"Rzuca Sztyletem",
	"Rzuca Toporem",
	"Rzuca Maczuga",
	"Rzuca Ostrym Kijem",
	"Rzuca Maczuga Ogra",
	"Rzuca Tasakiem Rzeznika",
	"Rzuca Ciezkim Kijem",
	"Rzuca Kamiennym Kijem",
	"Rzuca Mlotem",
	"Ognisty Blysk",
	"Uderzenie Pioruna",
	"Lodowy Blok",
	"Kula Piorunowa",
	"Kula Smierci",
	"Wlocznia Zla",
	"Piesc Wody",
	"Oplatanie Korzeniami",
	"Roj",
	"Straszliwy Smrod",
	"Strzala Wysysajaca",
	"Kula Wody",
	"Zatruta Strzala",
	"Kamienna Strzala",
	"Lodowy Blysk",
	"Lodowa Burza",
	"Kula Grzmotu",
	"Zielone Uderzenie",
	"Ognista Lanca",
	"Uderzenie Smierci",
	"Kula Mroku",
	"Wielka Kula Ognia",
	"Ognista Burza",
	"Mroczna Lanca",
	"Wielka Kula Mroku",
	"Tornado",
	"Mroczne Macki",
	"Fala Lodu",
	"Fala Smierci",
	"Czarna Mgla",
	"Spojrzenie Zaglady",
	"Burza",
	"Trujaca Chmura",
	"Gejzer",
	"Wir Energii",
	"Krzyk Umarlych",
	"Ognisty Calun",
	"Meteor",
	"Wstrzas",
	"Eksplozja",
	"Krwawa Burza",
	"Fala Elektryczna",
	"Marznacy Deszcz",
	"Wycie Otchlani",
	"Magiczny Wir",
	"Deszcz Ognia",
	"Zaawansowana Klatwa Mroku",
	"Fala Mroku",
	"Fala Ognia",
	"Kolczasty Susy",
	"Ognisty Susy",
	"Lodowy Susy",
	"Naladowany Skok",
	"Skrzydla Smierci",
	"Krok Cienia",
	"Ogluszajacy Skok",
	"Trujacy Skok",
	"Lekkie Leczenie Sojusznika",
	"Srednie Leczenie Sojusznika",
	"Silne Leczenie Sojusznika",
	"Sojusznicza Ochrona Sieczna",
	"Sojusznicza Ochrona Miazdzaca",
	"Sojusznicza Ochrona przed Ogniem",
	"Sojusznicza Ochrona przed Odrzutem",
	"Sojusznicza Ochrona przed Magia",
	"Sojusznicza Ochrona Kluta",
	"Dodatkowy Unik dla Sojusznikow",
	"Dodatkowe Obrazenia Wrecz dla Sojusznikow",
	"Dodatkowe Obrazenia Dystansowe dla Sojusznikow",
	"Dodatkowe Obrazenia Magiczne dla Sojusznikow",
	"Dodatkowa Tarcza Energii dla Sojusznikow",
	"Wzrost Sily Sojusznikow",
	"Wzrost Zrecznosci Sojusznikow",
	"Wzrost Witalnosci Sojusznikow",
	"Wzrost Regeneracji Witalnosci Sojusznikow",
	"Wzrost Regeneracji Tarczy Energii Sojusznikow",
	"Lekkie Leczenie",
	"Srednie Leczenie",
	"Silne Leczenie",
	"Ochrona Sieczna",
	"Ochrona Mieszana",
	"Ochrona przed Ogniem",
	"Ochrona przed Odrzutem",
	"Ochrona przed Magia",
	"Ochrona Kluta",
	"Dodatkowy Unik",
	"Dodatkowe Obrazenia Wrecz",
	"Dodatkowe Obrazenia Dystansowe",
	"Dodatkowe Obrazenia Magiczne",
	"Dodatkowa Tarcza Energii",
	"Zwiekszona Sila",
	"Zwiekszona Zrecznosc",
	"Zwiekszona Witalnosc",
	"Zwiekszona Regeneracja Witalnosci",
	"Zwiekszona Regeneracja Tarczy Energii",
	"Zwiekszona Szybkosc",
	"Wzrost Szybkosci Sojusznikow",
	"Ochrona przed Trucizna dla Sojusznikow",
	"Ochrona przed Trucizna",
	"Pasywna Regeneracja Witalnosci",
	"Pasywna Regeneracja Tarczy Energii",
	"Odbicie Obrazen w Walce Wrecz",
	"Odbicie Zaklec",
	"Berserk",
	"Wysysanie Witalnosci",
	"Wysysanie Magii",
	"Wysysanie Tarczy Energii",
	"Dodatkowe Obrazenia Miazdzace",
	"Dodatkowe Obrazenia Sieczne",
	"Dodatkowe Obrazenia Klute",
	"Dodatkowe Obrazenia od Ognia",
	"Dodatkowe Obrazenia Trujace",
	"Dodatkowe Obrazenia Magiczne",
	"Dodatkowe Obrazenia Odrzutu",
	"Obrazenia Miazdzace",
	"Obrazenia Rozlupujace",
	"Obrazenia Klute",
	"Obrazenia od Podpalenia",
	"Obrazenia Trujace",
	"Obrazenia od Klatwy",
	"Obrazenia Duszace",
	"Ogluszenie",
	"Zamrozenie",
	"Fala Ognia po Otrzymaniu Obrazen",
	"Fala Lodu po Otrzymaniu Obrazen,",
	"Fala Trucizny po Otrzymaniu Obrazen",
	"Fala Mroku po Otrzymaniu Obrazen",
	"Odbicie Strzal",
	"Pochlanianie Zaklec",
	"Ignorowanie Obrazen",
	"Odpornosc na Obrazenia Obszarowe",
	"Odbicie Obrazen od Ognia (Wrecz)",
	"Odbicie Obrazen Magicznych (Wrecz)",
	"Odbicie Obrazen Trujacych (Wrecz)",
	"Odbicie Obrazen Klutych (Wrecz)",
	"Odbicie Obrazen Miazdzacych (Wrecz)",
	"Odbicie Obrazen Siecznych (Wrecz)",
	"Odbicie Obrazen Odrzutu (Wrecz)",
	"Kradziez Wytrzymalosci",
	"Fala Elektryczna po Obrazeniach",
	"Fala Korzeni po Obrazeniach",
	"Wstrzas po Obrazeniach",
	"Krwawy Deszcz po Obrazeniach",
	"Regeneracja Witalnosci",
	"Regeneracja Tarczy Energii",
	"Fala Smierci przy Zgonie",
	"Fala Lodu przy Zgonie",
	"Fala Ognia przy Zgonie",
	"Fala Trucizny przy Zgonie",
	"Fala Elektryczna przy Zgonie",
	"Przyzwanie Mroku przy Zgonie",
	"Przyzwanie Demona przy Zgonie",
	"Przyzwanie Pelzaczy przy Zgonie",
	"Przyzwanie Wilkow przy Zgonie",
	"Deszcz Ognia przy Zgonie",
	"Lodowy Deszcz przy Zgonie",
	"Krwawy Deszcz przy Zgonie",
	"Fala Mroku przy Zgonie",
	"Rzucajacy Uroki",
	"Truciciel",
	"Odpornosc na Obrazenia Sieczne",
	"Odpornosc na Obrazenia Mieszane",
	"Odpornosc na Obrazenia Klute",
	"Odpornosc na Magie",
	"Odpornosc na Ogien",
	"Odpornosc na Odrzut",
	"Odpornosc na Trucizne",
	"Obrazenia Obszarowe",
	"Obrazenia Lancuchowe",
	"Wsciekly",
	"Silny",
	"Zwinny",
	"Twardy",
	"Twardy",
	"Szybki",
	"Tarcza Energii",
	"Uskakujacy",
	"Stalowa Skora",
	"Odbicie Obrazen od Ognia (Dystans)",
	"Odbicie Obrazen Magicznych (Dystans)",
	"Odbicie Obrazen Trujacych (Dystans)",
	"Odbicie Obrazen Klutych (Dystans)",
	"Odbicie Obrazen Obuchowych (Dystans)",
	"Odbicie Obrazen Siecznych (Dystans)",
	"Odbicie Obrazen Odrzutu (Dystans)",
	"Odbicie Obrazen Dystansowych",
	"Odbicie Obrazen od Ognia (od Magii)",
	"Odbicie Obrazen Magicznych (od Magii)",
	"Odbicie Obrazen Trujacych (od Magii)",
	"Odbicie Obrazen Klutych (od Magii)",
	"Odbicie Obrazen Obuchowych (od Magii)",
	"Odbicie Obrazen Siecznych (od Magii)",
	"Odbicie Obrazen Odrzutu (od Magii)",
	"Odbicie Obrazen Magicznych (od Magii)",
	"Upuszczajacy Krew",
	"Przyzwanie Golemow przy Zgonie",
	"Przyzwanie Zwierzat przy Zgonie",
	"Przyzwanie Goblinow przy Zgonie",
	"Przyzwanie Pasozytow przy Zgonie",
	"Pasywna Regeneracja Witalnosci dla Sojusznikow",
	"Pasywna Regeneracja Tarczy Energii dla Sojusznikow",
	"Ognisty Calun",
	"Lodowy Calun",
	"Piorunowy Calun",
	"Mroczny Calun",
	"Smiertelny Calun",
	"Trujacy Calun",
	"Wiatrowy Calun",
	"Krwawy Calun",
	"Ziemny Calun",
	"Calun Ostrzy",
	"Przyzwanie Szkieleta Goblina",
	"Przyzwanie Ognistego Golema",
	"Przyzwanie Lodowego Golema",
	"Przyzwanie Golema",
	"Przyzwanie Szkieletu",
	"Przyzwanie Wilkow",
	"Przyzwanie Padlinozercow",
	"Przyzwanie Szczurow",
	"Przyzwanie Dzikow",
	"Przyzwanie Goblinow",
	"Przyzwanie Zwierzat",
	"Przyzwanie Demona",
	"Przyzwanie Armii Mroku",
	"Przyzwanie Kamiennego Straznika",
	"Przyzwanie Zombie",
	"Przyzwanie Bagiennego Golema",
	"Przyzwanie Drewnianego Golema",
	"Przyzwanie Glorhkow",
	"Przyzwanie Krwawych Szerszeni",
	"Przyzwanie Pelzaczy",
	"Przyzwanie Szczurolakow",
	"Przyzwanie Szkieletow Lucznikow",
	"Przyzwanie Szkieletow Magow",
	"Przyzwanie Modliszek",
	"Przyzwanie Ghuli",
	"Przyzwanie Polnych Drapiezcow",
	"Przyzwanie Pajakow",
	"Przyzwanie Waranow",
	"Teleportuje do siebie"
};

const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_LevelMod = "Modyfikator mocy losowych NPC zalezny od poziomu bohatera";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_KapitelMod = "Modyfikator mocy losowych NPC zalezny od rozdzialu";
const string StExt_Str_Config_WorldRandomization_Npc_SpawnPower_DayMod = "Modyfikator mocy losowych NPC za dzien";

const string StExt_Str_Config_WorldRandomization_EmptyChestsUpdateCount = "Liczba pustych skrzyn do odnowienia";
const string StExt_Str_Config_WorldRandomization_PutInAnyChest = "Odnow zawartosc dowolnych skrzyn";
const string StExt_Str_Config_WorldRandomization_LockChest = "Zamykaj skrzynie podczas losowania";

const string StExt_Str_Small_Icegolem = "Maly Lodowy Golem";
const string StExt_Str_Weak_Icegolem = "Slaby Lodowy Golem";
const string StExt_Str_Small_Swampgolem = "Maly Bagienny Golem";
const string StExt_Str_Small_Firegolem = "Maly Ognisty Golem";
const string StExt_Str_Weak_Firegolem = "Slaby Ognisty Golem";
const string StExt_Str_Small_Stonegolem = "Maly Kamienny Golem";
const string StExt_Str_Weak_Stonegolem = "Slaby Kamienny Golem";

const string StExt_Str_Karma_Innos = "Karma Innosa: ";
const string StExt_Str_Karma_Beliar = "Karma Beliara: ";
const string StExt_Str_Karma_Adanos = "Karma Adanosa: ";



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
