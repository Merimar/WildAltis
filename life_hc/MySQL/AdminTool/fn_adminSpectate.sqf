private _unit = param [0, objNull, [objNull]];
private _spectatePlayer = param [1, objNull, [objNull]];
private _start = param [2, true, [true]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_adminSpectate", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

[_unit, _start] remoteExec ["TON_fnc_adminInvisible", 2];

if(!_start) exitWith {
private _oldPos = _unit getVariable ["oldPos", [0, 0, 0]];
detach _unit;
_unit setPos _oldPos;
};

if(isNull _spectatePlayer) exitWith {};
_unit setVariable ["oldPos", getPos _unit];

["AdminLog", format ["Der Spieler %1 (%2 - %3) spectatet gerade %4 (%5 - %6)", name _unit, getPlayerUID _unit, side _unit, name _spectatePlayer, getPlayerUID _spectatePlayer, side _spectatePlayer]] call HC_fnc_Log;

sleep 1;

_unit attachTo [_spectatePlayer, [0, 0, 1]];