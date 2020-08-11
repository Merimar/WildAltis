private _fish = param [0, objNull, [objNull]];
if(isNull _fish || {alive _fish}) exitWith {};

private _fishTypes = getArray (missionConfigFile >> "Life_Settings" >> "fish_types");
if(!((typeOf _fish) in _fishTypes)) exitWith {};
if(!(player inArea "Farm_Turtle_1") && !(player inArea "Farm_Turtle_2") && !(player inArea "Farm_Turtle_3")) exitWith {};

private _fishName = getText (configFile >> "CfgVehicles" >> typeOf _fish >> "displayName");
private _weight = getNumber (missionConfigFile >> "Items" >> typeOf _fish >> "weight");

if((life_carryWeight + _weight) > life_maxWeight) exitWith {titleText ["Dein Inventar ist voll!", "PLAIN"];};

titleText [format ["Du hast einen %1 gefangen!", _fishName], "PLAIN"];
[true, typeOf _fish, 1] call life_fnc_handleInv;
deleteVehicle _fish;
[player, typeOf _fish] remoteExec ["HC_fnc_gatherFish", HC_LIFE];