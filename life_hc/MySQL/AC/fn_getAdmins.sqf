_adminList = playableUnits select {([getPlayerUID _x, "admin"] call HC_fnc_getSpecialLevel) > 0};
_adminList;