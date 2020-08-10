params ["_unit", "_role", "_vehicle", "_turret"];

if(_role != "driver") exitWith {};

_vehicle removeAllEventHandlers "Engine";
_vehicle addEventHandler ["Engine", life_fnc_engine];
[_vehicle] call life_fnc_addExplosionEH;