if(!isNil "COP_SAVE_GEAR") exitWith {
player setUnitLoadout COP_SAVE_GEAR;
[] call life_fnc_updateCom;
};

private _copLvl = call life_coplevel;
private _handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_Rangemaster";
player addBackpack "B_Bergen_tna_F";

player addMagazine "30Rnd_9x21_Mag";
player addWeapon "hgun_P07_snds_F";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] call life_fnc_updateCom;