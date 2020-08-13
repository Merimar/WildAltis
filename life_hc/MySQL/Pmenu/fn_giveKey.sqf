#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];
private _keyPlayer = param [2, objNull, [objNull]];
private _giveGang = param [3, false, [false]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_giveKey"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle || {!(alive _vehicle)}) exitWith {};

private _group = group _unit;
private _groupName = _group getVariable ["gang_name", ""];
private _owners = _vehicle getVariable ["vehicle_info_owners", []];
private _nearUnits = (units _group) select {_x distance _unit < 50 && alive _x && !(_vehicle in (missionNamespace getVariable [format ["%1_KEYS_%2", getPlayerUID _x, side _x],[]]))};
private _nearUnitsStringArray = [];
{_nearUnitsStringArray pushBack (format ["%1 (%2 - %3)", name _x, getPlayerUID _x, side _x]);}forEach _nearUnits;
private _keyPlayerInfo = if(_giveGang) then {_nearUnitsStringArray joinString ", ";} else {format ["%1 (%2 - %3)", name _keyPlayer, getPlayerUID _keyPlayer, side _keyPlayer]};
private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

if(_giveGang && count _nearUnits isEqualTo 0) exitWith {};

if(_giveGang) then {
{
[_unit, _vehicle, [getPlayerUID _x] call HC_fnc_getGeheimzahl] remoteExec ["life_fnc_getKey", _x];
[getPlayerUID _x, side _x, _vehicle, 1] call HC_fnc_keyManagement;
_owners pushBack [getPlayerUID _x, name _x];
}forEach _nearUnits;

_vehicle setVariable ["vehicle_info_owners", _owners, true];
}else {
[_unit, _vehicle, [getPlayerUID _keyPlayer] call HC_fnc_getGeheimzahl] remoteExec ["life_fnc_getKey", _keyPlayer];
[getPlayerUID _keyPlayer, _vehicle, 1] call HC_fnc_keyManagement;
_owners pushBack [getPlayerUID _keyPlayer, name _keyPlayer];

_vehicle setVariable ["vehicle_info_owners", _owners, true];
};

private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 die Schluessel fuer seinen %5 gegeben", name _unit, getPlayerUID _unit, side _unit, _keyPlayerInfo, _vehicleName];
["KeyLog", _msg] call HC_fnc_Log;