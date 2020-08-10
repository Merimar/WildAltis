private _unit = param [0, objNull, [objNull]];
private _clear = nearestObjects [_unit,["weaponholder"],3];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_clearGround"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

{deleteVehicle _x;}forEach _clear;

private _msg = format ["Der Spieler %1 (%2 - %3) hat Items auf dem Boden gelöscht", name _unit, getPlayerUID _unit, side _unit];
["CopLog", _msg] call HC_fnc_Log;