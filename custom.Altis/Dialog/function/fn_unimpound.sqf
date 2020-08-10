#include "..\..\Functions\script_macros.hpp"
disableSerialization;
private _display = findDisplay 2800;
private _list = _display displayCtrl 2801;
private _index = lbCurSel 2801;

if(_index isEqualTo -1) exitWith {["Du musst ein Fahrzeug auswählen was du ausparken willst.", "Keine Auswahl"] spawn life_fnc_message;};

private _dataArray = call compile format["%1", _list lbData _index];
private _id = _dataArray select 0;
private _classname = _dataArray select 1;
private _displayName = ([_classname] call life_fnc_fetchVehInfo) select 3;

if((time - life_action_delay) < 15) exitWith {["Du kannst nur alle 15 Sekunden ein Fahrzeug ausparken", "Wartezeit"] spawn life_fnc_message;};
if(!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classname)) exitWith {["Dieses Fahrzeug gibt es nicht", "Ungültiges Fahrzeug"] spawn life_fnc_message;};

private _storageFee = [_classname] call life_fnc_getStorageFee;
if(BANK < _storageFee) exitWith {["Du kannst dir die Ausparkkosten nicht leisten", "Kein Geld"] spawn life_fnc_message;};
life_action_delay = time;

if(VEHICLE_TYPE == "Air") then {private _vIndex = GARAGE_AIR_VEHICLES findIf {(_x select 0) isEqualTo _id};if(_vIndex != -1) then {GARAGE_AIR_VEHICLES deleteAt _vIndex;};};
if(VEHICLE_TYPE == "Car") then {private _vIndex = GARAGE_VEHICLES findIf {(_x select 0) isEqualTo _id};if(_vIndex != -1) then {GARAGE_VEHICLES deleteAt _vIndex;};};
if(VEHICLE_TYPE == "Ship") then {private _vIndex = GARAGE_WATER_VEHICLES findIf {(_x select 0) isEqualTo _id};if(_vIndex != -1) then {GARAGE_WATER_VEHICLES deleteAt _vIndex;};};

[player, _id, VEHICLE_SPAWNPOINT] remoteExec ["HC_fnc_spawnVehicle", HC_Life];

closeDialog 0;