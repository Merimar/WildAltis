#include "..\script_macros.hpp"
disableSerialization;
private _vehicle = param [0, objNull, [objNull]];
private _display = findDisplay 3500;

if(isNull _vehicle || {!(alive _vehicle)}) exitWith {closeDialog 0;};

private _vInv = _display displayCtrl 3501;
private _pInv = _display displayCtrl 3502;
private _vWeight = _display displayCtrl 3504;
private _pWeight = _display displayCtrl 3505;
lbClear _vInv;
lbClear _pInv;

private _vehData = [_vehicle] call life_fnc_vehicleWeight;
if((_vehData select 0) isEqualTo -1) exitWith {closeDialog 0};

private _data = _vehicle getVariable ["Trunk", []];
if(count _data isEqualTo 0) then {_vehicle setVariable["Trunk", [[], 0], true];_data = [];} else {_data = _data select 0;};

{
private _item = _x select 0;
private _amount = _x select 1;
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_amount > 0) then {
_pInv lbAdd format ["[%1] - %2", _amount, _displayName];
_pInv lbSetData [(lbSize _pInv)-1, _item];
};
}forEach life_virt_gear;

{
private _item = _x select 0;
private _amount = _x select 1;
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_amount > 0) then {
_vInv lbAdd format ["[%1] - %2", _amount, _displayName];
_vInv lbSetData [(lbSize _vInv)-1, _item];
};
}forEach _data;

private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

_vWeight ctrlSetText format ["%1 [Gewicht: %2/%3]", _vehicleName, _vehData select 1, _vehData select 0];
_pWeight ctrlSetText format ["%1 [Gewicht: %2/%3]", profileName, life_carryWeight, life_maxWeight];