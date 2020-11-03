//Interagieren möglich
this setVariable ["Interaction", true];

//Fraktion festlegen
this setVariable ["Interaction_Side", sideUnknown];
this setVariable ["Interaction_Side", civilian];
this setVariable ["Interaction_Side", west];
this setVariable ["Interaction_Side", independent];

//Liste zusammenstellen
this setVariable ["Interaction_List", []];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Kart Shop
this setVariable ["Interaction_List", [["Kartshop", "['civ_gokart', 'Spawn_Kart_Civ_1'] call life_fnc_vehicleShopMenu;", "'driver' in LICENSES"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "'driver' in LICENSES"]]];


//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Chop Shop (LEGAL)
this setVariable ["Interaction_List", [["Chop Shop (LEGAL)", "['LandVehicle', true, _targetCall] spawn life_fnc_chopShopMenu;", "true"]]];

//Chop Shop (ILLEGAL)
this setVariable ["Interaction_List", [["Chop Shop (ILLEGAL)", "['LandVehicle', false, _targetCall] spawn life_fnc_chopShopMenu;", "true"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Hideout einnehmen
this setVariable ["Interaction_List", [["Hideout einnehmen", "[] spawn life_fnc_captureHideout;", "true"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//DP Mission
this setVariable ["Interaction_List", [["Starte Kurier Mission", "[_targetCall] call life_fnc_getDPMission;", "playerSide in [east, civilian] && isNil ""DP_MISSION_START"" && !DP_MISSION_ACTIVE"], ["Paket ausliefern", "[_targetCall] call life_fnc_dpFinish;", "playerSide in [civilian, east] && !isNil ""DP_MISSION_START"" && DP_MISSION_ACTIVE && (if(isNil ""DP_MISSION_END"") then {objNull} else {DP_MISSION_END}) isEqualTo _this"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Gangeroberungsschild
this setVariable ["Interaction_List", [["Fahrzeuggarage", "['Car', 'Spawn_GE_CarGar_1'] call life_fnc_openGarage;", "(SCHILD_DEALER getVariable ['Zone_Dealer_Winner', '']) == ((group player) getVariable ['gang_name', '-1'])"], ["Helikoptergarage", "['Air', 'gang_capture'] call life_fnc_openGarage;", "(SCHILD_DEALER getVariable ['Zone_Dealer_Winner', '']) == ((group player) getVariable ['gang_name', '-1'])"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "(SCHILD_DEALER getVariable ['Zone_Dealer_Winner', '']) == ((group player) getVariable ['gang_name', '-1'])"]]];

//Fahrzeug einparken Schild
this setVariable ["Interaction_List", [["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]]];

//GE Waffen Schild
this setVariable ["Interaction_List", [["Waffenshop", "['Waffenshop', 'reb_schwer'] call life_fnc_weaponShopMenu;", "'rebel' in LICENSES && playerSide isEqualTo east"], ["Verbesserter Waffenshop", "['Verbesserter Waffenshop', 'ge_shop'] call life_fnc_weaponShopMenu;", "'rebel' in LICENSES && playerSide isEqualTo east && (SCHILD_DEALER getVariable ['Zone_Dealer_Winner', '']) == ((group player) getVariable ['gang_name', '-1']) && ['shop'] call life_fnc_isBuffOn;"], ["Markt", "['reb', _targetCall] call life_fnc_virt_menu;", "true"], ["Loadout", "[] call life_fnc_openLoadout;", "true"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Helikoper Shop Schilder (REB - MIT GARAGE)
this setVariable ["Interaction_List", [["Helikoptershop", "['reb_air', 'Spawn_Air_Reb_1'] call life_fnc_vehicleShopMenu;", "playerSide isEqualTo east"], ["Helikoptergarage", "['Air', 'Spawn_Air_Reb_1'] call life_fnc_openGarage;", "playerSide isEqualTo east"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "playerSide isEqualTo east"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Car Shop Schilder (CIV - OHNE GARAGE)
this setVariable ["Interaction_List", [["LKW Laden", "['civ_truck', 'Spawn_Truck_Civ_1'] call life_fnc_vehicleShopMenu;", "playerSide isEqualTo civilian && 'lkw' in LICENSES && 'driver' in LICENSES"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "playerSide isEqualTo civilian && 'lkw' in LICENSES && 'driver' in LICENSES"]]];

//Car Shop Schilder (REB - MIT GARAGE)
this setVariable ["Interaction_List", [["Fahrzeugshop", "['reb_car', 'Spawn_Car_Reb_1'] call life_fnc_vehicleShopMenu;", "playerSide isEqualTo east"], ["Fahrzeuggarage", "['Car', 'Spawn_Car_Reb_1'] call life_fnc_openGarage;", "playerSide isEqualTo east"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "playerSide isEqualTo east"]]];

//Car Shop Schilder (COP - MIT GARAGE)
this setVariable ["Interaction_List", [["Fahrzeugshop", "['cop_car', 'Spawn_Car_Cop_1'] call life_fnc_vehicleShopMenu;", "true"], ["Fahrzeuggarage", "['Car', 'Spawn_Car_Cop_1'] call life_fnc_openGarage;", "true"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]]];

//Car Shop Schilder (MEDIC - MIT GARAGE)
this setVariable ["Interaction_List", [["Fahrzeugshop", "['med_car', 'Spawn_Car_FW_1'] call life_fnc_vehicleShopMenu;", "true"], ["Fahrzeuggarage", "['Car', 'Spawn_Car_FW_1'] call life_fnc_openGarage;", "true"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Air Garagen Schilder (CIV/REB)
this setVariable ["Interaction_List", [["Helikoptergarage", "['Air', 'Spawn_AirGar_Civ_1'] call life_fnc_openGarage;", "true"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Car Garagen Schilder (CIV/REB)
this setVariable ["Interaction_List", [["Fahrzeuggarage", "['Car', 'Spawn_CarGar_Civ_1'] call life_fnc_openGarage;", "true"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//COP SUPPLY SHOP
this setVariable ["Interaction_List", [["Copshop", "['Polizei Shop', 'cop'] call life_fnc_weaponShopMenu;", "true"], ["Loadout", "[] call life_fnc_openLoadout;", "true"], ["Itemshop", "['cop', _targetCall] call life_fnc_virt_menu;", "true"]]];

//MEDIC SUPPLY SHOP
this setVariable ["Interaction_List", [["Medicshop", "['Medic Shop', 'med'] call life_fnc_weaponShopMenu;", "true"], ["Loadout", "[] call life_fnc_openLoadout;", "true"], ["Itemshop", "['med', _targetCall] call life_fnc_virt_menu;", "true"]]];

//REB SUPPLY SHOP
this setVariable ["Interaction_List", [["Leichter Waffenshop", "['Leichter Waffenshop', 'reb_leicht'] call life_fnc_weaponShopMenu;", "'rebel' in LICENSES"], ["Schwerer Waffenshop", "['Schwerer Waffenshop', 'reb_schwer'] call life_fnc_weaponShopMenu;", "'rebel' in LICENSES && playerSide isEqualTo east"], ["Loadout", "[] call life_fnc_openLoadout;", "'rebel' in LICENSES"], ["Rebellmarkt", "['reb', _targetCall] call life_fnc_virt_menu;", "'rebel' in LICENSES"], ["Rebellenlizenz kaufen (€960.000)", "['rebel'] call life_fnc_buyLicense;", "!('rebel' in LICENSES)"]]];

//HIDEOUT SUPPLY Shop 1
this setVariable ["Interaction_List", [["Hideout Shop", "['Hideout Shop', 'gang'] call life_fnc_weaponShopMenu;", "(((nearestObjects [getPosATL player, ['Land_u_Barracks_V2_F', 'Land_i_Barracks_V2_F'], 25]) select 0) getVariable ['gangOwner', grpNull]) isEqualTo (group player)"]]];

//HIDEOUT SUPPLY Shop 2
this setVariable ["Interaction_List", [["Hideoutmarkt", "['reb', _targetCall] call life_fnc_virt_menu;", "(((nearestObjects [getPosATL player, ['Land_u_Barracks_V2_F', 'Land_i_Barracks_V2_F'], 25]) select 0) getVariable ['gangOwner', grpNull]) isEqualTo (group player)"]]];

//ZIVIL SHOP
this setVariable ["Interaction_List", [["Zivilfahndungsshop", "['Zivilfahndungsshop', 'zivil'] call life_fnc_weaponShopMenu;", "'zivil' in LICENSES"]]];

this setVariable ["Interaction_List", [["Götterdämmerung", "['Götterdämmerung', 'god'] call life_fnc_weaponShopMenu;", "true"]]];

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Boat Shop Schilder (CIV - OHNE GARAGE)
this setVariable ["Interaction_List", [["Bootshop", "['civ_boat', 'Spawn_Boat_Civ_1'] call life_fnc_vehicleShopMenu;", "playerSide isEqualTo civilian"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "playerSide isEqualTo civilian"]]];

//Boat Shop Schilder (COP - MIT GARAGE)
this setVariable ["Interaction_List", [["Bootshop", "['cop_ship', 'Spawn_Boat_Cop_1'] call life_fnc_vehicleShopMenu;", "true"], ["Helikoptergarage", "['Ship', 'Spawn_Boat_Cop_1'] call life_fnc_openGarage;", "true"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]]];

//Boat Shop Schilder (MEDIC - MIT GARAGE)
this setVariable ["Interaction_List", [["Bootshop", "['medic_ship', 'Spawn_Boat_FW_1'] call life_fnc_vehicleShopMenu;", "true"], ["Helikoptergarage", "['Ship', 'Spawn_Boat_FW_1'] call life_fnc_openGarage;", "true"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]]];



//Virtshop
this setVariable ["Interaction_List", [["Geschäftsmann", "['business', _targetCall] call life_fnc_virt_menu;", "true"]]];

this setVariable ["Interaction_List", [["Geistlicher", "[] call life_fnc_geistlicher;", "true"]]];

//Generalstore
this setVariable ["Interaction_List", [["Tankstelle", "['Tankstelle', 'generalstore'] call life_fnc_weaponShopMenu;", "true"]]];

//Gunstore
this setVariable ["Interaction_List", [["Waffenladen", "['Waffenladen', 'gun'] call life_fnc_weaponShopMenu;", "'gun' in LICENSES"]]];

//Taucherladen
this setVariable ["Interaction_List", [["Tauchershop", "['Tauchershop', 'dive'] call life_fnc_weaponShopMenu;", "'dive' in LICENSES"]]];

//Medizinische Hilfe
this setVariable ["Interaction_List", [["Medizinische Hilfe", "[] spawn life_fnc_medHilfe;", "true"]]];

//Kleidungsladen
this setVariable ["Interaction_List", [["Kleidungsshop", "['Gucci Store', 'clothing'] call life_fnc_weaponShopMenu;", "true"]]];

//Lizenzladen
this setVariable ["Interaction_List", [["Führerschein kaufen (€1500)", "['driver'] call life_fnc_buyLicense;", "!('driver' in LICENSES)"], ["LKW Führerschein kaufen (€21.000)", "['lkw'] call life_fnc_buyLicense;", "!('lkw' in LICENSES)"], ["Bootschein kaufen (€1100)", "['boat'] call life_fnc_buyLicense;", "!('boat' in LICENSES)"], ["Pilotenschein kaufen (€35.000)", "['air'] call life_fnc_buyLicense;", "!('air' in LICENSES)"], ["Waffenschein kaufen (€35.000)", "['gun'] call life_fnc_buyLicense;", "!('gun' in LICENSES)"], ["Tauchschein kaufen (€2100)", "['dive'] call life_fnc_buyLicense;", "!('dive' in LICENSES)"], ["Hauseigentumslizenz kaufen (€500.000)", "['haus'] call life_fnc_buyLicense;", "!('haus' in LICENSES)"]]];
this setVariable ["Interaction_List", [["Medizinausbildung (ADRENALIN - €500.000)", "['adrenalin'] call life_fnc_buyLicense;", "!('adrenalin' in LICENSES)"], ["Feldausbildung (DEFI - €350.000)", "['defi'] call life_fnc_buyLicense;", "!('defi' in LICENSES)"]]];

//Schliesfach
this setVariable ["Interaction_List", [["Schliesfach", "[] call life_fnc_lockerMenu;", "true"]]];

//Markt
this setVariable ["Interaction_List", [["Markt", "['civ', _targetCall] call life_fnc_virt_menu;", "true"]]];

//Lackierer
this setVariable ["Interaction_List", [["Lackierer", "[] call life_fnc_lackiererSend;", "true"]]];

//Verarbeiter
this setVariable ["Interaction_List", [["Verarbeiten", "[_targetCall, 'Marihuana'] spawn life_fnc_processAction;", "(((nearestObjects [getPosATL player, ['Land_u_Barracks_V2_F', 'Land_i_Barracks_V2_F'], 25]) select 0) getVariable ['gangOwner', grpNull]) isEqualTo (group player)"]]];

//Service Chopper
this setVariable ["Interaction_List", [["Helikopter reparieren", "[] spawn life_fnc_serviceShopper;", "true"]]];

//UBahn
this setVariable ["Interaction_List", [["UBahn", "[] call life_fnc_openUBahn;", "'rebel' in LICENSES"]]];

//Halojump
this setVariable ["Interaction_List", [["Halojump (€100.000)", "[] spawn life_fnc_haloJump;", "'rebel' in LICENSES"]]];

//Gangdealer
this setVariable ["Interaction_List", [["Gangdealer", "['gangdealer', _targetCall] call life_fnc_virt_menu;", "(markerPos 'GangDealer') distance player < 50"]]];

//Zentralbank
this setVariable ["Interaction_List", [["Tresor öffnen", "[] call life_fnc_zentiMenuOpen;", "zenti getVariable ['open', false] && playerSide isEqualTo east"], ["Tresor schliesen", "[] spawn life_fnc_safeFix;", "zenti getVariable ['open', false] && playerSide isEqualTo west"]]];

//AAN News
this setVariable ["Interaction_List", [["AAN News", "[] call life_fnc_openAAN;", "true"]]];

//Schrottplatz
this setVariable ["Interaction_List", [["Schrottplatz", "[] call life_fnc_openJunkyardMenu;", "true"]]];

//Versicherung
this setVariable ["Interaction_List", [["Versicherung", "[] call life_fnc_openInsuranceMenu;", "true"]]];

//Aircraft Schild
this setVariable ["Interaction_List", [["", "['Air', 'Spawn_Aircraft'] call life_fnc_openGarage;", "true"], ["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]]];

//Zeus Tempel
this setVariable ["Interaction_List", [["Zeus Tempel", "['Zeus Tempel', 'zeus'] call life_fnc_weaponShopMenu;", "true"]]];

//ATM
["Bankautomat", "[] call life_fnc_atmMenu;", "true"]

//Waffenshop
["Itemshop", "['Shopname', 'Shopconfig'] call life_fnc_weaponShopMenu;", "true"]

//Loadout
["Loadout", "[] call life_fnc_openLoadout;", "true"]

//Verarbeiter + Händler
["Verarbeiten", "[_targetCall, 'Route'] spawn life_fnc_processAction;", "true"]
["Markt", "['Config', _targetCall] call life_fnc_virt_menu;", "true"]

//Schliesfach
["Schliesfach", "[] call life_fnc_lockerMenu;", "true"]

//Med. Hilfe
["Medizinische Hilfe", "[] spawn life_fnc_medHilfe;", "true"]

//Vehicleshop + Garage + Einparken
["Fahrzeugshop", "['Config', 'SP'] call life_fnc_vehicleShopMenu;", "true"]
["Garage", "['Car', 'SP'] call life_fnc_openGarage;", "true"]
["Fahrzeug Einparken", "[] call life_fnc_storeVehicle;", "true"]

//Lizenzen
["Lizenz kaufen", "['Lizenz'] call life_fnc_buyLicense;", "true"]

//DP Missions
["Starte Kurier Mission", "[_targetCall] call life_fnc_getDPMission;", "playerSide in [east, civilian] && isNil ""DP_MISSION_START"" && !DP_MISSION_ACTIVE"]
["Paket ausliefern", "[_targetCall] call life_fnc_dpFinish;", "playerSide in [civilian, east] && !isNil ""DP_MISSION_START"" && DP_MISSION_ACTIVE && (if(isNil ""DP_MISSION_END"") then {objNull} else {DP_MISSION_END}) isEqualTo _this"]

//UBahn
["UBahn", "[] call life_fnc_openUBahn;", "true"]

//Halojump
["Halojump", "[] spawn life_fnc_haloJump;", "true"]

//Lackierer
["Lackierer", "[] call life_fnc_lackiererSend;", "true"]

//Abstellhof
["Abstellhof", "[] call life_fnc_openAbstellhofMenu;", "true"]

//Schrottplatz
["Schrottplatz", "[] call life_fnc_openJunkyardMenu;", "true"]

//Versicherung
["Versicherung", "[] call life_fnc_openInsuranceMenu;", "true"]

//Kleine Bank
["Bank ausrauben", "[_targetCall, 6] call life_fnc_robBank;", "true"]

//Air Service Station
["Helikopter reparieren", "[] spawn life_fnc_serviceShopper;", "true"]

//Hideout einnehmen
["Hideout einnehmen", "[] spawn life_fnc_captureHideout;", "true"]

//AAN News
["AAN News", "[] call life_fnc_openAAN;", "true"]

//Chop Shop
["Chop Shop", "['LandVehicle', true, _targetCall] spawn life_fnc_chopShopMenu;", "true"]

//Zentralbank
["Tresor öffnen", "[] call life_fnc_zentiMenuOpen;", "true"]