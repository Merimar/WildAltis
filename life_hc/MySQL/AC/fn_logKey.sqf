#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _key = param [1, "DRUCK", [""]];

private _isHacker = [[_key], _unit, remoteExecutedOwner, "fn_logKey"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _msg = format ["Der Spieler %1 (%2 - %3) hat die %4 Taste gedrueckt", name _unit, getPlayerUID _unit, side _unit, _key];
["KeyLog", _msg] call HC_fnc_Log;

if(_key == "INSERT") then {
_adminList = playableUnits select {([getPlayerUID _x, side _x, "admin"] call HC_fnc_getSpecialLevel) > 4};
[format ["Der Spieler %1 hat die INSERT Taste gedrückt", name _unit], false, "slow"] remoteExec ["life_fnc_notification_system", _adminList];
};