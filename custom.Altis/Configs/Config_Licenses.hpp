#define LICENSE(NAME,DISPLAYNAME,PRICE,ILLEGAL,SIDE,COAST) class NAME { \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
		noLicenseCost = COAST; \
	};
	
class Licenses {
	LICENSE(driver,"STR_License_Driver",1000,false,"civ",10000)
	LICENSE(boat,"STR_License_Boat",1100,false,"civ",10000)
	LICENSE(dive,"STR_License_Diving",2100,false,"civ",10000)
	LICENSE(ziegel,"STR_License_Lehm",6500,false,"civ",10000)
	LICENSE(kupfer,"STR_License_Kupfer",8000,false,"civ",10000)
	LICENSE(wein,"STR_License_Wein",9000,false,"civ",10000)
	LICENSE(eisen,"STR_License_Eisen",9500,false,"civ",10000)
	LICENSE(oil,"STR_License_Oil",10000,false,"civ",10000)
	LICENSE(salz,"STR_License_Salz",12000,false,"civ",10000)
	LICENSE(sand,"STR_License_Sand",14500,false,"civ",10000)
	LICENSE(erdgas,"STR_License_Erdgas",15000,false,"civ",10000)
	LICENSE(marihuana,"STR_License_Marihuana",45500,true,"civ",10000)
	LICENSE(lkw,"STR_License_lkw",21000,false,"civ",10000)
	LICENSE(heroin,"STR_License_Heroin",45000,true,"civ",10000)
	LICENSE(moonshine,"STR_License_Moonshine",25000,true,"civ",10000)
	LICENSE(meth,"STR_License_Meth",70000,true,"civ",10000)
	LICENSE(uranstable,"STR_License_UranStable",300000,true,"civ",10000)
	LICENSE(uranunstable,"STR_License_UranUnstable",300000,true,"civ",10000)
	LICENSE(reis,"STR_License_Reis",25000,false,"civ",10000)
	LICENSE(relikt,"STR_License_Knochen",28000,true,"civ",10000)
	LICENSE(kokain,"STR_License_Kokain",45000,true,"civ",10000)
	LICENSE(diamanten,"STR_License_Diamanten",35000,false,"civ",10000)
	LICENSE(gun,"STR_License_Firearm",35000,false,"civ",10000)
	LICENSE(air,"STR_License_Pilot",35000,false,"civ",10000)
	LICENSE(haus,"STR_License_Haus",600000,false,"civ",10000)
	LICENSE(rebel,"STR_License_Rebel",1160000,true,"civ",10000)
	LICENSE(titan,"STR_License_Titan",50000,false,"civ",10000)
	LICENSE(defi,"STR_License_defi",400000,false,"civ",10000)
	LICENSE(adrenalin,"STR_License_Adrenalin",550000,false,"civ",10000)
	LICENSE(zivil,"STR_License_ZivCops",5000,false,"west",10000)	
	LICENSE(baecker,"STR_License_Baecker",13000,false,"civ",10000)
	LICENSE(baumwolle,"STR_License_Baumwolle",13000,false,"civ",10000)
	LICENSE(beer,"STR_License_Beer",22000,false,"civ",10000)
	LICENSE(wine,"STR_License_Wine",22000,false,"civ",10000)
	LICENSE(gox,"STR_License_Geox",17000,false,"civ",10000)
	LICENSE(gummi,"STR_License_Gummi",17000,false,"civ",10000)
	LICENSE(holz,"STR_License_Holz",11000,false,"civ",10000)
	LICENSE(kohle,"STR_License_Kohle",31000,false,"civ",10000)
	LICENSE(treibstoff,"STR_License_Treibstoff",19000,false,"civ",10000)
	LICENSE(raritaet,"STR_License_Raritaet",65000,false,"civ",10000)
	LICENSE(sprengstoff,"STR_License_Sprengstoff",250000,true,"civ",10000)
	LICENSE(zucker,"STR_License_Zucker",8000,false,"civ",10000)
	LICENSE(lsd,"STR_License_LSD",70000,true,"civ",10000)
	LICENSE(labor,"STR_License_Labor",500000,true,"civ",10000)
};