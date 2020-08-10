private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_getAbstellhofVehicles"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _vehicleInformation = [-1, _pID, _pSide] call HC_fnc_getVehicleDatabase;
private _return = [];

{
private _id = _x select 0;
private _classname = _x select 1;
private _color = _x select 4;
private _material = _x select 5;
private _insurance = _x select 6;
private _impounded = _x select 7;

if(_impounded isEqualTo 1) then {
private _newArray = [_id, _classname, _color, _material, _insurance];
_return pushBack _newArray;
};
}forEach _vehicleInformation;

[_return] remoteExec ["life_fnc_AbstellhofGetUpdate",_unit];
