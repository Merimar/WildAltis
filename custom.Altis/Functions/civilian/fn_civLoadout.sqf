private _handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

private _uniform = if(playerSide isEqualTo civilian) then {"U_C_Man_casual_6_F"} else {"U_BG_Guerilla1_1"};
player forceAddUniform _uniform;

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

life_is_alive = true;
[] call life_fnc_updateCom;