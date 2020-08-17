private _unit = param [0, objNull, [objNull]];
private _spectateUnit = param [1, objNull, [objNull]];
private _start = param [2, true, [true]];
private _logType = param [3, false, [false]];
_logType = if(_logType) then {"AdminLog"} else {"CopLog"};

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_copSpectate"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _isSpectating = _unit getVariable ["Spectating", false];
private _oldPos = _unit getVariable ["oldPos", [0, 0, 0]];

if(!_isSpectating && _start) then {
_unit setVariable ["Spectating", true, true];
_unit setVariable ["oldPos", getPos _unit];
[_unit, _start] remoteExec ["TON_fnc_adminInvisible", 2];
};

if(!_start) exitWith {
_unit setVariable ["Spectating", false, true];
[_unit, _start] remoteExec ["TON_fnc_adminInvisible", 2];
detach _unit;
sleep 0.5;
_unit setPos _oldPos;
};

if(isNull _spectateUnit) exitWith {};

private _msg = format ["Der Spieler %1 (%2 - %3) spectatet den Spieler %4 (%5 - %6)", name _unit, getPlayerUID _unit, side _unit, name _spectateUnit, getPlayerUID _spectateUnit, side _spectateUnit];
[_logType, _msg] call HC_fnc_Log;

if(!_isSpectating && _start) then {
sleep 0.5;
_unit attachTo [_spectateUnit, [0, 0, 1]];
}else {
_unit attachTo [_spectateUnit, [0, 0, 1]];
};