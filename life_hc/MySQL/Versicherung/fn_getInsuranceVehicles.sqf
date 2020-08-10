private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_getInsuranceVehicles"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _databaseInformation = [-1, _pID, _pSide] call HC_fnc_getVehicleDatabase;
private _return = [];

{
private _id = _x select 0;
private _classname = _x select 1;
private _active = _x select 3;
private _color = _x select 4;
private _material = _x select 5;
private _insurance = _x select 6;
private _impounded = _x select 7;

if(_insurance isEqualTo 0 && _impounded isEqualTo 0 && _active isEqualTo 0) then {_return pushBack [_id, _classname, _color, _material];};
}forEach _databaseInformation;

[_return] remoteExec ["life_fnc_insuranceGetUpdate", _unit];