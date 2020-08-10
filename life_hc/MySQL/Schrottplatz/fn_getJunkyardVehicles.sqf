private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_getJunkyardVehicles"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _databaseInformation = [-1, _pID, _pSide, true] call HC_fnc_getVehicleDatabase;
private _return = [];

{
private _id = _x select 0;
private _classname = _x select 1;
private _color = _x select 4;
private _material = _x select 5;

_return pushBack [_id, _classname, _color, _material];
}forEach _databaseInformation;

[_return] remoteExec ["life_fnc_JunkyardGetUpdate", _unit];