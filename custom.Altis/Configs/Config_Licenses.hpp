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
	LICENSE(marihuana,"STR_License_Marihuana",19500,true,"civ",10000)
	LICENSE(lkw,"STR_License_lkw",21000,false,"civ",10000)
	LICENSE(heroin,"STR_License_Heroin",25000,true,"civ",10000)
	LICENSE(moonshine,"STR_License_Moonshine",25000,true,"civ",10000)
	LICENSE(reis,"STR_License_Reis",25000,false,"civ",10000)
	LICENSE(relikt,"STR_License_Knochen",28000,true,"civ",10000)
	LICENSE(kokain,"STR_License_Kokain",30000,true,"civ",10000)
	LICENSE(diamanten,"STR_License_Diamanten",35000,false,"civ",10000)
	LICENSE(gun,"STR_License_Firearm",35000,false,"civ",10000)
	LICENSE(air,"STR_License_Pilot",35000,false,"civ",10000)
	LICENSE(haus,"STR_License_Haus",600000,false,"civ",10000)
	LICENSE(rebel,"STR_License_Rebel",1160000,true,"civ",10000)
	LICENSE(defi,"STR_License_defi",400000,false,"civ",10000)
	LICENSE(adrenalin,"STR_License_Adrenalin",550000,false,"civ",10000)
	LICENSE(zivil,"STR_License_ZivCops",5000,false,"west",10000)
};