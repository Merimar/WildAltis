private _unit = param [0, objNull, [objNull]];
private _fish = param [1, "", [""]];
private _fishName = getText (configFile >> "CfgVehicles" >> _fish >> "displayName");

private _isHacker = [[_fish], _unit, remoteExecutedOwner, "fn_gatherFish"] call HC_fnc_checkSQLBreak;
if(_isHacker || _fishName == "") exitWith {};

[getPlayerUID _unit, _fish, 1, true] call HC_fnc_handleVirt;

private _msg = format ["Der Spieler %1 (%2 - %3) hat einen Fisch gefangen: %4", name _unit, getPlayerUID _unit, side _unit, _fishName];
["GatherLog", _msg] call HC_fnc_Log;