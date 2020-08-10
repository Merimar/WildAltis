private _unit = param [0, objNull, [objNull]];
private _config = param [1, "", [""]];
private _amount = param [2, 0, [0]];

private _isHacker = [[_config], _unit, remoteExecutedOwner, "fn_gather"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _route = missionConfigFile >> "CfgFarmRoutes" >> _config;
private _farmItem = getText (_route >> "gatherItem");
private _farmName = getText (_route >> "name");
private _farmSkill = getText (_route >> "gatherSkill");
private _displayName = getText (missionConfigFile >> "Items" >> _farmItem >> "name");

[getPlayerUID _unit, side _unit, _farmItem, _amount, true] call HC_fnc_handleVirt;

private _msg = format ["Der Spieler %1 (%2 - %3) hat %4 %5 gesammelt", name _unit, getPlayerUID _unit, side _unit, _amount, _displayName];
["GatherLog", _msg] call HC_fnc_Log;

if(_config in ["Helium", "Dunkle", "Relikt"]) exitWith {};
[getPlayerUID _unit, side _unit, _farmSkill] call HC_fnc_addSkill;