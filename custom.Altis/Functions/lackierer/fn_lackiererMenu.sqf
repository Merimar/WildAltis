private _vehicles = param [0, []];
disableSerialization;

if(count _vehicles isEqualTo 0) exitWith {["Du hast keine Fahrzeuge in deiner Garage!", "Lackierer"] spawn life_fnc_message;};
if(isNull findDisplay 3700) then {createDialog "Lackierer";};

private _display = findDisplay 3700;
private _vehicleList = _display displayCtrl 3701;

{
private _id = _x select 0;
private _className = _x select 1;
private _displayName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
private _picture = getText (configFile >> "CfgVehicles" >> _className >> "picture");

_vehicleList lbAdd _displayName;
_vehicleList lbSetData [(lbSize _vehicleList)-1, str _x];
_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _picture];
}forEach _vehicles;

_vehicleList lbSetCurSel 0;