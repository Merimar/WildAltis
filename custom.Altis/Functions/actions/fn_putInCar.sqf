private _unit = param [0, objNull];
if(isNull _unit || !isPlayer _unit) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10];
if(count _nearestVehicle isEqualTo 0) exitWith {["", "Es ist kein Fahrzeug in der Nähe"] spawn life_fnc_message;};

detach _unit;
[_nearestVehicle select 0] remoteExecCall ["life_fnc_moveIn", _unit];
_unit setVariable["Escorting", false, true];
_unit setVariable["transporting", true, true];