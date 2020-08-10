private _vehicle = _this select 0;
private _index = VEHICLE_INV_ARRAY findIf {(_x select 0) isEqualTo _vehicle};
_index;