#include "..\script_macros.hpp"
disableSerialization;
private _vehicle = param [0, objNull, [objNull]];
private _currentPlayer = _vehicle getVariable ["trunkPlayer", objNull];

if(!(isNull _currentPlayer) && _currentPlayer != player) exitWith {["", "Jemand Anderes ist schon im Fahrzeug Inventar"] spawn life_fnc_message;};
if(_vehicle getVariable ["mining", false]) exitWith {["", "Das Fahrzeug sammelt"] spawn life_fnc_message;};

private _vehData = [_vehicle] call life_fnc_vehicleWeight;
if((_vehData select 0) isEqualTo -1) exitWith {["", "Das Fahrzeug kann keine Items speichern"] spawn life_fnc_message;};

_vehicle setVariable ["trunkPlayer", player, true];
life_trunk_vehicle = _vehicle;
createDialog "Trunk";
[_vehicle] call life_fnc_vehInventory;

waitUntil {isNull findDisplay 3500};
_vehicle setVariable ["trunkPlayer", nil, true];