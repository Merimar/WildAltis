disableSerialization;
private _type = param [0, "LandVehicle"];
private _isLegal = param [1, false];
private _infostand = param [2, objNull];

if(!(isNull findDisplay 39400)) exitWith {};
createDialog "ChopShop";
private _display = findDisplay 39400;
private _vehicleList = _display displayCtrl 39401;
private _priceTag = _display displayCtrl 39402;
lbClear _vehicleList;

private _nearVehicles = nearestObjects [getPos _infostand, [_type], 50];

{
private _classname = typeOf _x;
private _displayName = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
private _picture = getText (configFile >> "CfgVehicles" >> _classname >> "picture");
private _isVehicleLegal = (getNumber (missionConfigFile >> "LifeCfgVehicles" >> _classname >> "legal")) isEqualTo 1;

if(_isVehicleLegal isEqualTo _isLegal) then {
_vehicleList lbAdd _displayName;
_vehicleList lbSetData [(lbSize _vehicleList)-1, netID _x];
_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _picture];
};
}forEach _nearVehicles;

if(lbSize _vehicleList isEqualTo 0) then {
_vehicleList lbAdd "Keine Fahrzeuge gefunden";
_vehicleList lbSetData [(lbSize _vehicleList)-1, ""];
};

_vehicleList lbSetCurSel 0;

CHOP_SHOP_INFOSTAND = _infostand;