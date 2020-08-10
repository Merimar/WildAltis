private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_serviceChopper"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

if(_vehicle isKindOf "Air") then {_vehicle setDamage 0;};