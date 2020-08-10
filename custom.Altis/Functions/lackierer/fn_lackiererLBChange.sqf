disableSerialization;
private _display = findDisplay 3700;
private _infoText = _display displayCtrl 3704;
private _vehicleList = _display displayCtrl 3701;
private _skinCombo = _display displayCtrl 3702;
private _materialCombo = _display displayCtrl 3703;

private _index = lbCurSel 3701;

if(_index isEqualTo -1) exitWith {};

private _data = call compile (_vehicleList lbData _index);
private _classname = _data select 1;
private _color = _data select 2;
private _material = _data select 3;
private _insurance = _data select 4;

private _insuranceName = if(_insurance isEqualTo 1) then {"Ja"} else {"Nein"};
private _skinName = [_classname, _color] call life_fnc_getSkinName;
private _materialName = [_material] call life_fnc_getMaterialName;
private _vehicleInfo = [_classname] call life_fnc_fetchVehInfo;
private _capacity = [_classname] call life_fnc_vehicleWeightCfg;
private _maxSpeed = _vehicleInfo select 8;
private _passengerSeats = _vehicleInfo select 10;
private _horsePower = _vehicleInfo select 11;
private _tank = _vehicleInfo select 12;

private _vehicleText = [["Farbe", _skinName, false], ["Folie", _materialName, false], ["Versicherung", _insuranceName, true], ["Max. Speed", _maxSpeed, false], [localize "STR_Garage2", _horsePower, false], [localize "STR_Garage3", _passengerSeats, false], [localize "STR_Garage4", _capacity, false], [localize "STR_Garage5", _tank, false]] call life_fnc_getVehicleDescription;
_infoText ctrlSetStructuredText parseText _vehicleText;

private _pSide = switch (playerSide) do {
    case west : {"cop"};
    case civilian : {"civ"};
	case east : {"civ"};
    case independent : {"med"};
};

private _pLevel = call life_donorlevel;
private _skinArray = "true" configClasses (missionConfigFile >> "LifeCfgVehicles" >> _classname >> "textures");
private _materialArray = "getNumber(_x >> 'premium') <= _pLevel" configClasses (missionConfigFile >> "LifeCfgMaterials");

lbClear _skinCombo;
lbClear _materialCombo;

_skinCombo lbAdd "Skin entfernen";
_skinCombo lbSetData [(lbSize _skinCombo)-1, str [_classname, "-1"]];

{
private _skinName = getText (_x >> "name");
private _condition = getText (_x >> "condition");
if(call compile _condition) then {
private _skinConfig = configName _x;
private _data = [_classname, _skinConfig];
_skinCombo lbAdd _skinName;
_skinCombo lbSetData [(lbSize _skinCombo)-1, str _data];
};
}forEach _skinArray;

_materialCombo lbAdd "Folie entfernen";
_materialCombo lbSetData [(lbSize _materialCombo)-1, str [_classname, "-1"]];

{
private _materialName = getText (_x >> "name");
private _materialConfig = configName _x;
private _data = [_classname, _materialConfig];
_materialCombo lbAdd _materialName;
_materialCombo lbSetData [(lbSize _materialCombo)-1, str _data];
}forEach _materialArray;