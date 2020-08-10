disableSerialization;
private _skinMaterial = param [0, 0];

private _display = findDisplay 3700;
private _vehicleList = _display displayCtrl 3701;
private _skinCombo = _display displayCtrl 3702;
private _materialCombo = _display displayCtrl 3703;
private _priceTag = _display displayCtrl 3705;

private _index = if(_skinMaterial isEqualTo 0) then {lbCurSel 3702} else {lbCurSel 3703};
if(_index <= 0) exitWith {_priceTag ctrlSetText "Preis: €0";};

private _data = call compile (if(_skinMaterial isEqualTo 0) then {_skinCombo lbData _index;} else {_materialCombo lbData _index;});
private _classname = _data select 0;
private _apply = _data select 1;

private _vehicleIndex = lbCurSel _vehicleList;
if(_vehicleIndex isEqualTo -1) exitWith {};

private _vData = call compile (_vehicleList lbData _vehicleIndex);
private _color = _vData select 2;
private _material = _vData select 3;
private _insurance = (_vData select 4) isEqualTo 1;

private _vehiclePrice = if(_skinMaterial isEqualTo 0) then {[_classname, "-1", _material, _insurance] call life_fnc_getVehiclePrice} else {[_classname, _color, "-1", _insurance] call life_fnc_getVehiclePrice};
private _changePrice = if(_skinMaterial isEqualTo 0) then {getNumber (missionConfigFile >> "LifeCfgVehicles" >> _classname >> "textures" >> _apply >> "price")} else {getNumber (missionConfigFile >> "LifeCfgMaterials" >> _apply >> "price")};
private _price = round (_vehiclePrice * _changePrice) - _vehiclePrice;

_priceTag ctrlSetStructuredText parseText format ["Preis: €%1", [_price] call life_fnc_numberText];