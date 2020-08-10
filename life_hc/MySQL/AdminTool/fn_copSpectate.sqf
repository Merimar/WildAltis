private _unit = param [0, objNull, [objNull]];
private _spectateUnit = param [1, objNull, [objNull]];
private _start = param [2, true, [true]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_copSpectate"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

[_unit, _start] remoteExec ["TON_fnc_adminInvisible", 2];

if(!_start) exitWith {
private _oldPos = _unit getVariable ["oldPos", [0, 0, 0]];
detach _unit;
_unit setPos _oldPos;
};

if(isNull _spectateUnit) exitWith {};
_unit setVariable ["oldPos", getPos _unit];

_msg = format ["Der Spieler %1 (%2 - %3) spectatet den Spieler %4 (%5 - %6)", name _unit, getPlayerUID _unit, side _unit, name _spectateUnit, getPlayerUID _spectateUnit, side _spectateUnit];
["CopLog", _msg] call HC_fnc_Log;

sleep 1;

_unit attachTo [_spectateUnit, [0, 0, 1]];