#include "..\script_macros.hpp"
disableSerialization;
private _vehicles = _this select 0;

if(isNull (findDisplay 2800)) exitWith {};

private _control = CONTROL(2800,2801);
lbClear _control;

{
private _id = _x select 0;
private _classname = _x select 1;
private _vehicleInfo = [_classname] call life_fnc_fetchVehInfo;

_control lbAdd (_vehicleInfo select 3);
_control lbSetData [(lbSize _control)-1, str _x];
_control lbSetPicture [(lbSize _control)-1, _vehicleInfo select 2];
_control lbSetValue [(lbSize _control)-1, _id];
}forEach _vehicles;