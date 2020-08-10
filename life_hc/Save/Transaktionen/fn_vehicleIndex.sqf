private _vehicle = _this select 0;

if(isNull _vehicle) exitWith {-1};
private _index = VEHICLE_INV_ARRAY findIf {(_x select 0) isEqualTo _vehicle};
_index;