#include "..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 2800;
private _list = _display displayCtrl 2801;
private _infoText = _display displayCtrl 2802;
private _unimpoundBtn = _display displayCtrl 2803;
private _sellBtn = _display displayCtrl 2804;
private _index = lbCurSel 2801;

if(_index isEqualTo -1) exitWith {};

private _dataArray = call compile format["%1", _list lbData _index];
private _classname = _dataArray select 1;
private _color = _dataArray select 2;
private _material = _dataArray select 3;
private _insurance = _dataArray select 4;

private _skinName = [_classname, _color] call life_fnc_getSkinName;
private _materialName = [_material] call life_fnc_getMaterialName;
private _insurancePrice = [_classname, _color, _material] call life_fnc_getInsurancePrice;
private _vehicleInfo = [_classname] call life_fnc_fetchVehInfo;
private _maxSpeed = _vehicleInfo select 8;
private _passengerSeats = _vehicleInfo select 10;
private _horsePower = _vehicleInfo select 11;
private _tank = _vehicleInfo select 12;

private _insuranceName = if(_insurance isEqualTo 1) then {"Versichert"} else {format ["€%1", [_insurancePrice] call life_fnc_numberText]};
private _impoundPrice = format ["€%1", [[_classname] call life_fnc_getAbstellhofPrice] call life_fnc_numberText];

private _vehicleText = [["Farbe", _skinName, false], ["Folie", _materialName, false], ["Versicherung", _insuranceName, true], ["Freikaufkosten", _impoundPrice, true], ["Max. Speed", _maxSpeed, false], [localize "STR_Garage2", _horsePower, false], [localize "STR_Garage3", _passengerSeats, false], [localize "STR_Garage4", _capacity, false], [localize "STR_Garage5", _tank, false]] call life_fnc_getVehicleDescription;
_infoText ctrlSetStructuredText parseText _vehicleText;