if((time - life_fix_delay) < 60) exitWith {playSound "error";};
life_fix_delay = time;

private _loadout = getUnitLoadout player;

player setUnitLoadout (configFile >> "EmptyLoadout");
sleep 1;
player setUnitLoadout _loadout;