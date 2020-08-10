private _vehicle = param [0, objNull];

if(isNull _vehicle || {!(alive _vehicle) || (player distance _vehicle) > 20}) exitWith {};

private _headPos = screenToWorld [0.5,0.5];

[player, _vehicle, _headPos] remoteExec ["HC_fnc_pushBoat", HC_LIFE];