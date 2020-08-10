#include "..\..\Functions\script_macros.hpp"
disableSerialization;
private _display = findDisplay 2800;
private _list = _display displayCtrl 2801;
private _index = lbCurSel 2801;

if(_index isEqualTo -1) exitWith {["Du musst ein Fahrzeug auswählen was du verkaufen willst.", "Keine Auswahl"] spawn life_fnc_message;};

private _dataArray = call compile format["%1", _list lbData _index];
private _id = _dataArray select 0;
private _classname = _dataArray select 1;
private _displayName = ([_classname] call life_fnc_fetchVehInfo) select 3;

if((time - life_action_delay) < 15) exitWith {["Du kannst nur alle 15 Sekunden ein Fahrzeug verkaufen", "Wartezeit"] spawn life_fnc_message;};
if(!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classname)) exitWith {["Dieses Fahrzeug gibt es nicht", "Ungültiges Fahrzeug"] spawn life_fnc_message;};

_action = ["Möchtest du das Fahrzeug wirklich verkaufen?", "Fahrzeug verkaufen?", "Verkaufen", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};
life_action_delay = time;

if(VEHICLE_TYPE == "Air") then {private _vIndex = GARAGE_AIR_VEHICLES findIf {(_x select 0) isEqualTo _id};if(_vIndex != -1) then {GARAGE_AIR_VEHICLES deleteAt _vIndex;};};
if(VEHICLE_TYPE == "Car") then {private _vIndex = GARAGE_VEHICLES findIf {(_x select 0) isEqualTo _id};if(_vIndex != -1) then {GARAGE_VEHICLES deleteAt _vIndex;};};
if(VEHICLE_TYPE == "Ship") then {private _vIndex = GARAGE_WATER_VEHICLES findIf {(_x select 0) isEqualTo _id};if(_vIndex != -1) then {GARAGE_WATER_VEHICLES deleteAt _vIndex;};};

private _sellPrice = [_classname] call life_fnc_getVehicleSellPrice;

[format ["Du hast ein/en %1 in deiner Garage für €%2 verkauft.", _displayName, [_sellPrice] call life_fnc_numberText], "Fahrzeug verkauft"] spawn life_fnc_message;
[player, _id] remoteExecCall ["HC_fnc_vehicleDelete", HC_Life];

BANK = BANK + _sellPrice;
closeDialog 0;