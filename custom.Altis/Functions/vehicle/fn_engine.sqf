params ["_vehicle", "_engineState"];

private _xVehicleSide = (_vehicle getVariable ["dbInfo", ["", sideUnknown, 0]]) select 1;

if((_xVehicleSide == west && playerSide == west) || (_xVehicleSide == independent && playerSide == independent) || !local _vehicle || !_engineState || _vehicle in life_vehicles || {_vehicle getVariable ["event_vehicle", false]}) exitWith {};

_vehicle engineOn false;

if(time - ENGINE_TIMER < 10) exitWith {};

titleText[format["Du benötigst den Schlüssel des Fahrzeugs um den Motor zu starten"],"PLAIN"];
ENGINE_TIMER = time;