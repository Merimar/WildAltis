private _spikeStrip = param [0, objNull];

if(isNull _spikeStrip) exitWith {};

_marker = createMarkerLocal [format["%1_marker", _spikeStrip], getPos _spikeStrip];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "mil_objective";
_marker setMarkerTextLocal "Nagelband";

waitUntil {isNull _spikeStrip};

deleteMarkerLocal _marker;