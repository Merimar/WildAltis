#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _corpse = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_playerRespawned"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _alive = [getPlayerUID _unit, "alive"] call HC_fnc_getSpecialLevel;
if(_alive) then {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte respawnen, lebt aber laut server noch", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1 (%2)", name _rem, getPlayerUID _rem];
[_unit, "Player Respawn Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
};

[getPlayerUID _unit, true] call HC_fnc_handleAlive;
private _gear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, _gear] call HC_fnc_handleInv;
[getPlayerUID _unit, "", 1, false, true] call HC_fnc_handleVirt;

private _index = _unit getVariable ["notruf_index", -1];
if(!(_index isEqualTo -1)) then {
_informationArray = bank_obj getVariable ["Emergency_Calls", []];
_information = _informationArray select _index;
_information set [5, true];
bank_obj setVariable ["Emergency_Calls", _informationArray, true];
};

if (!isNull _corpse) then {deleteVehicle _corpse;};

["RespawnLog", format ["%1 (%2 - %3) ist respawnt", name _unit, getPlayerUID _unit, side _unit]] call HC_fnc_Log;