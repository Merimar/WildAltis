private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_saveArsenal", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

sleep 0.5;
private _gear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, _gear] call HC_fnc_handleInv;

_unit setVariable ["uniformContainer", (uniformContainer _unit)];
_unit setVariable ["vestContainer", (vestContainer _unit)];
_unit setVariable ["backpackContainer", (backpackContainer _unit)];

private _msg = format ["Der Spieler %1 (%2 - %3) hat das Arsenal geschlossen", name _unit, getPlayerUID _unit, side _unit];
["AdminLog", _msg] call HC_fnc_Log;