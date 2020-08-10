disableSerialization;
if(isNull findDisplay 1200) then {createDialog "Key";};
private _display = findDisplay 1200;
private _vehicleList = _display displayCtrl 1201;
private _playerCombo = _display displayCtrl 1202;

lbClear _vehicleList;
lbClear _playerCombo;

private _nearUnits = playableUnits select {(player distance _x) < 15 && _x != player && alive _x && !(_x getVariable ["invisible", false])};

{
_playerCombo lbAdd (name _x);
_playerCombo lbSetData [(lbSize _playerCombo)-1, str(_x)];
}forEach _nearUnits;

_playerCombo lbAdd "Schlüssel an Gangmitglieder in der Nähe geben";

{
if(!(isNull _x) && {alive _x && !(_x isKindOf "House_F")}) then {
private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
private _vehiclePicture = getText (configFile >> "CfgVehicles" >> typeOf _x >> "picture");
private _vehicleOwner = (_x getVariable ["vehicle_info_owners", [["", "Unbekannt"]]]) select 0 select 1;
_vehicleList lbAdd format ["%1 - [Entfernung: %2m] [Besitzer: %3]", _vehicleName, round (player distance _x), _vehicleOwner];
_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _vehiclePicture];
_vehicleList lbSetValue [(lbSize _vehicleList)-1, _forEachIndex];
};
}forEach life_vehicles;

if((lbSize _vehicleList) isEqualTo 0) then {
_vehicleList lbAdd "Du besitzt keine Fahrzeuge";
_vehicleList lbSetValue [(lbSize _vehicleList)-1, -1];
};