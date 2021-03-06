private _vehicle = param [0, objNull, [objNull]];
private _endTime = servertime + (6 * 60);

if((_vehicle getVariable ["UranTime", 0]) != 0) exitWith {
if((_vehicle distance Processor_Uran_1) > 75) exitWith {};
private _newTime = (_vehicle getVariable ["UranTime", 0]) + 45;
_vehicle setVariable ["UranTime", _newTime, true];
};

_vehicle setVariable ["UranTime", _endTime, true];

private _vehicleType = typeOf _vehicle;
private _vehicleInfo = _vehicle getVariable ["dbInfo", ["", sideUnknown, 0]];

private _vPID = _vehicleInfo select 0;
private _vSide = _vehicleInfo select 1;
private _vUID = _vehicleInfo select 2;
private _vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleType >> "displayName");

waitUntil {_uranTime = _vehicle getVariable ["UranTime", 0]; isNull _vehicle || {!(alive _vehicle) || _uranTime isEqualTo 0 || (_uranTime - servertime) <= 0}};

if(!(alive _vehicle)) exitWith {};
if(isNull _vehicle) exitWith {["StrahlungLog", format ["Ein Fahrzeug: %1 mit Uran im Inventar wurde eingeparkt (PID: %2 SIDE: %3 UID: %4 REST-ZEIT: %5)", _vehicleName, _vPID, _vSide, _vUID, _endTime - servertime]] call HC_fnc_Log;};
if((_vehicle getVariable ["UranTime", 0]) isEqualTo 0) exitWith {};

_vehicle setDamage 1;
["StrahlungLog", format ["Ein Fahrzeug: %1 mit Uran im Inventar ist explodiert (PID: %2 SIDE: %3 UID: %4)", _vehicleName, _vPID, _vSide, _vUID]] call HC_fnc_Log;