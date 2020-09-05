class CfgFarmRoutes {
	class Oil {
		name = "Ölroute";
		fields[] = {"Farm_Oil"};
		processors[] = {"Processor_Oil_1"};
		vendors[] = {"Vendor_OilTreibstoff_1"};
		gatherItem = "oilU";
		gatherSkill = "farmFossil";
		gatherTool = "pickaxe";
		farmZonesize = 100;
		farmTime = 3;
		processInput[] = {{"oilU", 1}};
		processOutput[] = {{"oilP", 1}};
		processText = "Verarbeite Oel";
		processSkill = "processFossil";
		infoText = "";
	};
	
	class Diamanten {
		name = "Diamantenroute";
		fields[] = {"Farm_Diamant_1"};
		processors[] = {"Processor_Diamant_1"};
		vendors[] = {"Vendor_Diamant_1"};
		gatherItem = "diamantenU";
		gatherSkill = "farmStone";
		gatherTool = "pickaxe";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"diamantenU", 1}};
		processOutput[] = {{"diamantenP", 1}};
		processText = "Verarbeite Diamanten";
		processSkill = "processRock";
		infoText = "";
	};
	
	class Kokain {
		name = "Kokainroute";
		fields[] = {"Farm_Kokain_1"};
		processors[] = {"Processor_Kokain_1"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "kokainU";
		gatherSkill = "farmDrugs";
		gatherTool = "";
		farmZonesize = 50;
		farmTime = 3;
		processInput[] = {{"kokainU", 1}};
		processOutput[] = {{"kokainP", 1}};
		processText = "Verarbeite Kokain";
		processSkill = "processDrugs";
		infoText = "";
	};
	
	class UranStable {
		name = "Uranroute (Stable)";
		fields[] = {"Farm_Uran_1"};
		processors[] = {"Proccessor_Uran_2"};
		vendors[] = {"Vendor_Uran_2"};
		gatherItem = "uranU";
		gatherSkill = "farmDrugs";
		gatherTool = "pickaxe";
		farmZonesize = 75;
		farmTime = 15;
		processInput[] = {{"uranU", 1}};
		processOutput[] = {{"uranStableP", 1}};
		processText = "Verarbeite Stable Uran";
		processSkill = "processDrugs";
		infoText = "";
	};
	
	class UranUnstable {
		name = "Uranroute (Unstable)";
		fields[] = {"Farm_Uran_1"};
		processors[] = {"Proccessor_Uran_1"};
		vendors[] = {"Vendor_Uran_1"};
		gatherItem = "";
		gatherSkill = "farmDrugs";
		gatherTool = "pickaxe";
		farmZonesize = 0;
		farmTime = 15;
		processInput[] = {{"uranU", 1}};
		processOutput[] = {{"uranUnstableP", 1}};
		processText = "Verarbeite Unstable Uran";
		processSkill = "processDrugs";
		infoText = "";
	};
	
	class Heroin {
		name = "Heroinroute";
		fields[] = {"Farm_Heroin_1"};
		processors[] = {"Processor_Heroin_1"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "heroinU";
		gatherSkill = "farmDrugs";
		gatherTool = "";
		farmZonesize = 50;
		farmTime = 3;
		processInput[] = {{"heroinU", 1}};
		processOutput[] = {{"heroinP", 1}};
		processText = "Verarbeite Heroin";
		processSkill = "processDrugs";
		infoText = "";
	};
	
	class Marihuana {
		name = "Marihuanaroute";
		fields[] = {"Farm_Cannabis_1"};
		processors[] = {"Processor_Cannabis_1"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "marihuanaU";
		gatherSkill = "farmDrugs";
		gatherTool = "";
		farmZonesize = 50;
		farmTime = 3;
		processInput[] = {{"marihuanaU", 1}};
		processOutput[] = {{"marihuanaP", 1}};
		processText = "Verarbeite Cannabis";
		processSkill = "processDrugs";
		infoText = "";
	};
	
	class Sand {
		name = "Sandroute";
		fields[] = {"Farm_Glas_1"};
		processors[] = {"Processor_Glas_1"};
		vendors[] = {"Vendor_Glas_1"};
		gatherItem = "sandU";
		gatherSkill = "farmSand";
		gatherTool = "";
		farmZonesize = 50;
		farmTime = 3;
		processInput[] = {{"sandU", 1}};
		processOutput[] = {{"sandP", 1}};
		processText = "Verarbeite Sand";
		processSkill = "processSand";
		infoText = "";
	};
	
	class Salt {
		name = "Salzroute";
		fields[] = {"Farm_Salt_1"};
		processors[] = {"Processor_Salt_1"};
		vendors[] = {"Vendor_Salt_1"};
		gatherItem = "salzU";
		gatherSkill = "farmSand";
		gatherTool = "";
		farmZonesize = 50;
		farmTime = 3;
		processInput[] = {{"salzU", 1}};
		processOutput[] = {{"salzP", 1}};
		processText = "Verarbeite Salz";
		processSkill = "processFossil";
		infoText = "";
	};
	
	class Kupfer {
		name = "Kupferroute";
		fields[] = {"Farm_Kupfer_1"};
		processors[] = {"Processor_Kupfer_1"};
		vendors[] = {"Vendor_KupferEisen_1"};
		gatherItem = "kupferU";
		gatherSkill = "farmOre";
		gatherTool = "pickaxe";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"kupferU", 1}};
		processOutput[] = {{"kupferP", 1}};
		processText = "Verarbeite Kupfer";
		processSkill = "processOre";
		infoText = "";
	};
	
	class Eisen {
		name = "Eisenroute";
		fields[] = {"Farm_Eisen_1"};
		processors[] = {"Processor_Eisen_1"};
		vendors[] = {"Vendor_KupferEisen_1"};
		gatherItem = "eisenU";
		gatherSkill = "farmOre";
		gatherTool = "pickaxe";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"eisenU", 1}};
		processOutput[] = {{"eisenP", 1}};
		processText = "Verarbeite Eisen";
		processSkill = "processOre";
		infoText = "";
	};

	class Helium {
		name = "Methanroute";
		fields[] = {"Farm_Methan_1"};
		processors[] = {""};
		vendors[] = {"Vendor_Methan_1"};
		gatherItem = "heliumP";
		gatherSkill = "farmFossil";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 6;
		processInput[] = {{"heliumP", 1}};
		processOutput[] = {};
		processText = "";
		processSkill = "";
		infoText = "";
	};

	class Dunkle{
		name = "Meteoritenstückeroute";
		fields[] = {"Farm_Dunkle_1"};
		processors[] = {""};
		vendors[] = {"Vendor_Dunkle_1"};
		gatherItem = "dunkleP";
		gatherSkill = "farmFossil";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 6;
		processInput[] = {{"dunkleP", 1}};
		processOutput[] = {};
		processText = "";
		processSkill = "";
		infoText = "";
	};

	class Apple {
		name = "Apfelroute";
		fields[] = {"apple_1", "apple_2", "apple_3", "apple_4", "apple_5", "apple_6", "apple_7"};
		processors[] = {""};
		vendors[] = {"Markt_1","Markt_2","Markt_3","Markt_4","Markt_5","Markt_6","Markt_7","Markt_8","Markt_9","Markt_10"};
		gatherItem = "apple";
		gatherSkill = "farmFruit";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"apple", 1}};
		processOutput[] = {};
		processText = "";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Pfirsich {
		name = "Pfirsichroute";
		fields[] = {"peaches_1", "peaches_2", "peaches_3", "peaches_4", "peaches_5", "peaches_6", "peaches_7"};
		processors[] = {""};
		vendors[] = {"Markt_1","Markt_2","Markt_3","Markt_4","Markt_5","Markt_6","Markt_7","Markt_8","Markt_9","Markt_10"};
		gatherItem = "pfirsich";
		gatherSkill = "farmFruit";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"pfirsich", 1}};
		processOutput[] = {};
		processText = "";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Pakete {
		name = "Kofferroute";
		fields[] = {"PZentrum_1", "PZentrum_2", "PZentrum_3","PZentrum_4"};
		processors[] = {""};
		vendors[] = {"Postabgabe_1", "Postabgabe_2"};
		gatherItem = "paketeP";
		gatherSkill = "farmPost";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"paketeP", 1}};
		processOutput[] = {};
		processText = "";
		processSkill = "";
		infoText = "";
	};

	class Briefe {
		name = "Brieferoute";
		fields[] = {"briefos_1", "briefos_2", "briefos_3", "briefos_4", "briefos_5", "briefos_6","briefos_7"};
		processors[] = {""};
		vendors[] = {"Postabgabe_1", "Postabgabe_2"};
		gatherItem = "briefeP";
		gatherSkill = "farmPost";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 2;
		processInput[] = {{"briefeP", 1}};
		processOutput[] = {};
		processText = "";
		processSkill = "";
		infoText = "";
	};

	class Stone {
		name = "Steinroute (JAIL)";
		fields[] = {""};
		processors[] = {""};
		vendors[] = {""};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 1;
		processInput[] = {};
		processOutput[] = {};
		processText = "";
		processSkill = "";
		infoText = "";
	};

	class Unterhaendler {
		name = "Gefahrengutroute";
		fields[] = {"Gefahr_Buy_1"};
		processors[] = {""};
		vendors[] = {"Gefahr_Sell_1"};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 0;
		farmTime = 100;
		processInput[] = {};
		processOutput[] = {};
		processText = "";
		processSkill = "";
		infoText = "";
	};

	class Baecker {
		name = "Bäckereiroute";
		fields[] = {"Farm_Baecker_1"};
		processors[] = {"Processor_Baecker_1"};
		vendors[] = {"Vendor_Baecker_1"};
		gatherItem = "weizenU";
		gatherSkill = "farmFruit";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"weizenU", 1}};
		processOutput[] = {{"weizenP", 1}};
		processText = "Verarbeite Weizen";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Beer {
		name = "Bierroute";
		fields[] = {"Farm_Beer_1"};
		processors[] = {"Processor_Beer_1"};
		vendors[] = {"Vendor_BeerWine_1"};
		gatherItem = "beerU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"beerU", 1}};
		processOutput[] = {{"beerP", 1}};
		processText = "Verarbeite Hopfen";
		processSkill = "processGrapes";
		infoText = "";
	};
	
	class WineE {
		name = "Weinroute [Experte]";
		fields[] = {"Farm_Wine_1"};
		processors[] = {"Processor_Wine_1"};
		vendors[] = {"Vendor_BeerWine_1"};
		gatherItem = "traubenU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"traubenU", 1}};
		processOutput[] = {{"wineP_S", 1}};
		processText = "Verarbeite Wein";
		processSkill = "processGrapes";
		infoText = "";
	};

	class WineA {
		name = "Weinroute [Amateur]";
		fields[] = {"Farm_Wine_1"};
		processors[] = {"Processor_Wine_2"};
		vendors[] = {"Vendor_BeerWine_1"};
		gatherItem = "traubenU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"traubenU", 1}};
		processOutput[] = {{"wineP_A", 1}};
		processText = "Verarbeite Wein";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Gox {
		name = "Deichfrauroute";
		fields[] = {""};
		processors[] = {"Processor_Deichfrau_1"};
		vendors[] = {"Vendor_Deichfrau_1"};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"gummiU", 1},{"baumwolleU", 1}};
		processOutput[] = {{"geoxP", 1}};
		processText = "Verarbeite zu Gox";
		processSkill = "processFossil";
		infoText = "";
	};

	class Gummi {
		name = "Gummiroute";
		fields[] = {"Farm_Gummi_1"};
		processors[] = {"Processor_Gummi_1"};
		vendors[] = {"Vendor_Gummi_1"};
		gatherItem = "gummiU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"gummiU", 1}};
		processOutput[] = {{"gummiP", 1}};
		processText = "Verarbeite Gummi";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Baumwolle {
		name = "Baumwolleroute";
		fields[] = {"Farm_Baumwolle_1"};
		processors[] = {"Processor_Baumwolle_1"};
		vendors[] = {"Markt_1","Markt_2","Markt_3","Markt_4","Markt_5","Markt_6","Markt_7","Markt_8","Markt_9","Markt_10"};
		gatherItem = "baumwolleU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"baumwolleU", 1}};
		processOutput[] = {{"baumwolleP", 1}};
		processText = "Verarbeite Baumwolle";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Holz {
		name = "Holzroute";
		fields[] = {"Farm_Holz_1"};
		processors[] = {"Processor_Holz_1"};
		vendors[] = {"Vendor_Holz_1"};
		gatherItem = "holzU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"holzU", 1}};
		processOutput[] = {{"holzP", 1}};
		processText = "Verarbeite Holz";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Kohle {
		name = "Kohleroute";
		fields[] = {"Farm_Kohle_1"};
		processors[] = {"Processor_Kohle_1"};
		vendors[] = {"Vendor_Kohle_1"};
		gatherItem = "kohleU";
		gatherSkill = "farmOre";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"kohleU", 1}};
		processOutput[] = {{"kohleP", 1}};
		processText = "Verarbeite Kohle";
		processSkill = "processOre";
		infoText = "";
	};

	class Treibstoff {
		name = "Treibstoffroute";
		fields[] = {"Farm_Treibstoff_1"};
		processors[] = {"Processor_Treibstoff_1"};
		vendors[] = {"Vendor_OilTreibstoff_1"};
		gatherItem = "treibstoffU";
		gatherSkill = "farmFossil";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"treibstoffU", 1}};
		processOutput[] = {{"treibstoffP", 1}};
		processText = "Verarbeite Treibstoff";
		processSkill = "processFossil";
		infoText = "";
	};

	class Raritaet {
		name = "Raritätenroute";
		fields[] = {"Farm_Raritaet_1"};
		processors[] = {"Processor_Raritaet_1"};
		vendors[] = {"Vendor_Raritaet_1"};
		gatherItem = "raritaetU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 10;
		processInput[] = {{"raritaetU", 1}};
		processOutput[] = {{"raritaetP", 1}};
		processText = "Verarbeite Rarität";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Recyling {
		name = "Recyclingroute";
		fields[] = {"Farm_Schrott_1"};
		processors[] = {""};
		vendors[] = {"Vendor_Recycling_1"};
		gatherItem = "recyclingP";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"recyclingP", 1}};
		processOutput[] = {};
		processText = "Verarbeite Schrott";
		processSkill = "processGrapes";
		infoText = "";
	};

	class Sprengstoff {
		name = "Sprengstoffroute";
		fields[] = {"Farm_Schwarzpulver_1"};
		processors[] = {"Processor_Sprengstoff_1"};
		vendors[] = {"Vendor_Sprengstoff_1"};
		gatherItem = "sprengstoffU";
		gatherSkill = "farmStone";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"sprengstoffU", 1}};
		processOutput[] = {{"sprengstoffP", 1}};
		processText = "Verarbeite Sprengstoff";
		processSkill = "processRock";
		infoText = "";
	};

	class Zucker {
		name = "Zuckerroute";
		fields[] = {"Farm_Zuckerrohr_1"};
		processors[] = {"Processor_Zucker_1"};
		vendors[] = {"Vendor_Zucker_1"};
		gatherItem = "zuckerU";
		gatherSkill = "farmFruit";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"zuckerU", 1}};
		processOutput[] = {{"zuckerP", 1}};
		processText = "Verarbeite Zucker";
		processSkill = "processGrapes";
		infoText = "";
	};

	class LSD {
		name = "LSDroute";
		fields[] = {"Farm_LSD_1"};
		processors[] = {"Processor_LSD_1"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "lsdU";
		gatherSkill = "farmDrugs";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"lsdU", 1}};
		processOutput[] = {{"lsdP", 1}};
		processText = "Verarbeite Frösche";
		processSkill = "processDrugs";
		infoText = "";
	};

	class Meth {
		name = "Methroute";
		fields[] = {"Farm_Meth_1"};
		processors[] = {"Processor_Meth_1"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "methU";
		gatherSkill = "farmDrugs";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"methU", 1}};
		processOutput[] = {{"methP", 1}};
		processText = "Verarbeite Meth";
		processSkill = "processDrugs";
		infoText = "";
	};



////////////////////////////////////////////////////////////

	class LSDS {
		name = "LSDroute [Gestreckt]";
		fields[] = {""};
		processors[] = {"Processor_Strecken_1", "Processor_Strecken_2", "Processor_Strecken_3"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 0;
		farmTime = 3;
		processInput[] = {{"lsdP", 1}};
		processOutput[] = {{"lsdPS", 1}};
		processText = "Strecke LSD";
		processSkill = "processDrugs";
		infoText = "";
	};

	class MethS {
		name = "Methroute [Gestreckt]";
		fields[] = {""};
		processors[] = {"Processor_Strecken_1", "Processor_Strecken_2", "Processor_Strecken_3"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 0;
		farmTime = 3;
		processInput[] = {{"methP", 1}};
		processOutput[] = {{"methPS", 1}};
		processText = "Strecke Meth";
		processSkill = "processDrugs";
		infoText = "";
	};

	class KokainS {
		name = "Kokainroute [Gestreckt]";
		fields[] = {""};
		processors[] = {"Processor_Strecken_1", "Processor_Strecken_2", "Processor_Strecken_3"};  
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 0;
		farmTime = 3;
		processInput[] = {{"kokainP", 1}};
		processOutput[] = {{"kokainPS", 1}};
		processText = "Strecke Kokain";
		processSkill = "processDrugs";
		infoText = "";
	};
	
	class HeroinS {
		name = "Heroinroute [Gestreckt]";
		fields[] = {""};
		processors[] = {"Processor_Strecken_1", "Processor_Strecken_2", "Processor_Strecken_3"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 0;
		farmTime = 3;
		processInput[] = {{"heroinP", 1}};
		processOutput[] = {{"heroinPS", 1}};
		processText = "Strecke Heroin";
		processSkill = "processDrugs";
		infoText = "";
	};
	
	class MarihuanaS {
		name = "Marihuanaroute [Gestreckt]";
		fields[] = {""};
		processors[] = {"Processor_Strecken_1", "Processor_Strecken_2", "Processor_Strecken_3"};
		vendors[] = {"Drugdealer_1", "Drugdealer_2", "Drugdealer_3","Drugdealer_4"};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 0;
		farmTime = 3;
		processInput[] = {{"marihuanaP", 1}};
		processOutput[] = {{"marihuanaPS", 1}};
		processText = "Strecke Cannabis";
		processSkill = "processDrugs";
		infoText = "";
	};	
};