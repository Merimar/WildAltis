private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_save"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

[getPlayerUID _unit] call HC_fnc_saveToDatabase;