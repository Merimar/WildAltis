#include "..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 3650;
if(isNull _display) exitWith {};
private _vehicleList = _display displayCtrl 3651;
private _vehicleInfo = _display displayCtrl 3654;
private _index = lbCurSel _vehicleList;
if(_index isEqualTo -1) exitWith {};

private _netID = _vehicleList lbData _index;
if(_netID isEqualTo "") exitWith {};

private _vehicle = objectFromNetId _netID;
private _displayName = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
private _vehicleOwner = if(count (_vehicle getVariable ["vehicle_info_owners",[]]) isEqualTo 0) then {"Kein Besitzer"} else {((_vehicle getVariable ["vehicle_info_owners",[]]) select 0) select 1};
private _max = getNumber (missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "bankCapacity");
private _current = _vehicle getVariable ["zenti_fuel", 0];
private _prg = round((_current / _max) * 100);

_vehicleInfo ctrlSetStructuredText parseText format[
	"Fahrzeugname: <t color='#8cff9b'>%1</t><br/>"+
	"Fahrzeughalter: <t color='#8cff9b'>%2</t><br/>"+
	"Fahrzeugladung: <t color='#8cff9b'>%3</t><br/>",
	_displayName,
	_vehicleOwner,
	format["%1/%2 (%3%4)", _current, _max, _prg, "%"]
];