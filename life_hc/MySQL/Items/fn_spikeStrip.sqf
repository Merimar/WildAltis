private _spikeStrip = param [0, objNull];

if(isNull _spikeStrip) exitWith {};
waitUntil {_nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],5]; count _nearVehicles > 0 || isNull _spikeStrip};

if(isNull _spikeStrip) exitWith {};
private _vehicle = _nearVehicles select 0;

if(isNil "_vehicle") exitWith {deleteVehicle _spikeStrip;};
[_vehicle] remoteExec ["life_fnc_spikeStripEffect",_vehicle];
deleteVehicle _spikeStrip;