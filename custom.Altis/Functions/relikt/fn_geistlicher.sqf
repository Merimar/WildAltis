private _relikt = "";

for "_int" from 0 to 4 step 1 do {
private _itemAmount = [format ["Relikt_%1", _int]] call life_fnc_getItemValue;
if(_itemAmount > 0) exitWith {_relikt = format ["Relikt_%1", _int];};
};

if(_relikt == "") exitWith {["Du hast keinen Knochen dabei!", "Grabräuber"] spawn life_fnc_message;};
[player, _relikt] remoteExec ["HC_fnc_geistlicher", HC_LIFE];
[false, _relikt, 1] call life_fnc_handleInv;