class CfgFarmRoutes {
	class Oil {
		name = "Ölroute";
		fields[] = {"Farm_Oil_1","Farm_Oil_2"};
		processors[] = {"Processor_Oil_1"};
		vendors[] = {"Vendor_Oil_1"};
		gatherItem = "oilU";
		gatherSkill = "farmFossil";
		gatherTool = "pickaxe";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"oilU", 1}};
		processOutput[] = {{"oilP", 1}};
		processText = "Verarbeite Oel";
		processSkill = "processFossil";
		infoText = "";
	};

	class Diamanten {
		name = "Diamantenroute";
		fields[] = {"Farm_Diamond_1", "Farm_Diamond_2"};
		processors[] = {"Processor_Diamond_1", "Processor_Diamond_2"};
		vendors[] = {"Vendor_Diamond_1"};
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
		fields[] = {"Farm_Coke_1"};
		processors[] = {"Processor_Coke_1"};
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
		fields[] = {"Farm_Weed_1"};
		processors[] = {"Processor_Weed_1"};
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
	
	class Salz {
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
		fields[] = {"Farm_Copper_1", "Farm_Copper_2"};
		processors[] = {"Processor_Copper_1","Processor_Copper_2"};
		vendors[] = {"Vendor_Metal_1", "Vendor_Metal_2","Vendor_Metal_3"};
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
		fields[] = {"Farm_Iron_1","Farm_Iron_2"};
		processors[] = {"Processor_Iron_1","Processor_Iron_2"};
		vendors[] = {"Vendor_Metal_1", "Vendor_Metal_2","Vendor_Metal_3"};
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
	
	class Erdgas {
		name = "Biogas";
		fields[] = {"Farm_Gas_1"};
		processors[] = {"Processor_Gas_1"};
		vendors[] = {"Vendor_Gas_1"};
		gatherItem = "erdgasU";
		gatherSkill = "farmFossil";
		gatherTool = "";
		farmZonesize = 100;
		farmTime = 3;
		processInput[] = {{"erdgasU", 1}};
		processOutput[] = {{"erdgasP", 1}};
		processText = "Verarbeite Biogas";
		processSkill = "processFossil";
		infoText = "";
	};
	
	class Ziegel {
		name = "Ziegelroute";
		fields[] = {"Farm_Brick_1"};
		processors[] = {"Processor_Brick_1"};
		vendors[] = {"Vendor_Brick_1"};
		gatherItem = "ziegelU";
		gatherSkill = "farmStone";
		gatherTool = "";
		farmZonesize = 50;
		farmTime = 3;
		processInput[] = {{"ziegelU", 1}};
		processOutput[] = {{"ziegelP", 1}};
		processText = "Verarbeite Ziegel";
		processSkill = "processRock";
		infoText = "";
	};
	
	class Reis {
		name = "Reisroute";
		fields[] = {"Farm_Reis_1"};
		processors[] = {"Processor_Reis_1","Processor_Reis_2"};
		vendors[] = {"Markt_1","Markt_2","Markt_3","Markt_4","Markt_5","Markt_6","Markt_7","Markt_8","Markt_9","Markt_10"};
		gatherItem = "baumwolleU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"baumwolleU", 1}};
		processOutput[] = {{"kleidungP", 1}};
		processText = "Verarbeite Reis";
		processSkill = "processGrapes";
		infoText = "";
	};
	
	class Wein {
		name = "Weinroute";
		fields[] = {"Farm_Grape_1"};
		processors[] = {"Processor_GrapeLegal_1"};
		vendors[] = {"Vendor_GrapeLegal_1"};
		gatherItem = "traubenU";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"traubenU", 1}};
		processOutput[] = {{"traubenP", 1}};
		processText = "Verarbeite Trauben";
		processSkill = "processGrapes";
		infoText = "";
	};
	
	class Moonshine {
		name = "Schwarzgebrannterroute";
		fields[] = {"Farm_Grape_1"};
		processors[] = {"Processor_GrapeIllegal_1"};
		vendors[] = {"Vendor_Wongs_1", "Vendor_Wongs_2", "Vendor_Wongs_3", "Vendor_Wongs_4"};
		gatherItem = "moonshineP";
		gatherSkill = "farmGrapes";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"traubenU", 1}};
		processOutput[] = {{"moonshineP", 1}};
		processText = "Verarbeite Schwarzgebrannten";
		processSkill = "processDrugs";
		infoText = "";
	};
	
	class Relikt {
		name = "Knochenroute";
		fields[] = {"Farm_Relikttempel_1"};
		processors[] = {"Processor_Relikttempel_1"};
		vendors[] = {"Vendor_Relikttempel_1", "Vendor_Relikttempel_2"}; // Geistlicher - Vendor 1 Geschäftsmann - Vendor 2
		gatherItem = "relikt";
		gatherSkill = "farmFossil";
		gatherTool = "";
		farmZonesize = 12;
		farmTime = 15;
		processInput[] = {{"relikt", 1}};
		processOutput[] = {};
		processText = "Verarbeite Knochen";
		processSkill = "";
		infoText = "";
	};

	class Helium {
		name = "Methanroute";
		fields[] = {"Farm_Helium_1"};
		processors[] = {""};
		vendors[] = {"Vendor_Helium_1"};
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

	class Bananen {
		name = "Karottenroute";
		fields[] = {"Farm_Karotten_1", "Farm_Karotten_2", "Farm_Karotten_3", "Farm_Karotten_4", "Farm_Karotten_5", "Farm_Karotten_6", "Farm_Karotten_7"};
		processors[] = {""};
		vendors[] = {"Markt_1","Markt_2","Markt_3","Markt_4","Markt_5","Markt_6","Markt_7","Markt_8","Markt_9","Markt_10"};
		gatherItem = "bananen";
		gatherSkill = "farmFruit";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 3;
		processInput[] = {{"bananen", 1}};
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
		fields[] = {""};
		processors[] = {""};
		vendors[] = {"Gefahr_Buy_1","Gefahr_Sell_1"};
		gatherItem = "";
		gatherSkill = "";
		gatherTool = "";
		farmZonesize = 30;
		farmTime = 2;
		processInput[] = {};
		processOutput[] = {};
		processText = "";
		processSkill = "";
		infoText = "";
	};
};