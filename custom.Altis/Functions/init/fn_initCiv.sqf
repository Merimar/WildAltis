private _premiumSlots = [];
private _stringPlayer = str player;
for "_int" from 81 to 100 step 1 do {_premiumSlots pushBack format ["civ_pp_%1", _int];};
for "_int" from 61 to 80 step 1 do {_premiumSlots pushBack format ["rebel_pp_%1", _int];};

/*
if(_stringPlayer in _premiumSlots && call life_donorlevel isEqualTo 0 && call life_adminlevel isEqualTo 0) then {
player enableSimulation false;
["NotPremium", false, true] call BIS_fnc_endMission;
sleep 35;
};
*/