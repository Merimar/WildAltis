#include "..\script_macros.hpp"
if(!(isNull objectParent player)) exitWith {};

if(STORE_TIMER) exitWith {["Du kannst nur alle 20 Sekunden ein Fahrzeug einparken. Bitte habe etwas Geduld", "Wartezeit"] spawn life_fnc_message;};
STORE_TIMER = true;
[] spawn {sleep 20;STORE_TIMER = false;};

private _nearVehicles = nearestObjects[getPos player,["Car","Air","Ship"],40];
private _playerVehicles = _nearVehicles select {_vehInfo = _x getVariable ["dbInfo", []];(count _vehInfo > 0) && {(_vehInfo select 0) == getPlayerUID player && (_vehInfo select 1) == playerSide}};

if(count _playerVehicles isEqualTo 0) exitWith {["", "Es ist kein Fahrzeug in der Nähe"] spawn life_fnc_message;};
private _vehicle = _playerVehicles select 0;

if(_vehicle getVariable ["rent", false]) exitWith {["", "Das Fahrzeug ist nur gemietet"] spawn life_fnc_message;};
if(!alive _vehicle) exitWith {["", "Das Fahrzeug ist zerstört"] spawn life_fnc_message;};
if(_vehicle getVariable ["UranTime", 0] != 0) exitWith {["In dem Fahrzeug befindet sich noch ein Unstable uran. Das Item kann nur einem Fachmann übergeben werden.", "Unstable Uran"] spawn life_fnc_message;};

[player, _vehicle] remoteExec ["HC_fnc_vehicleStore", HC_LIFE];