private _vehicle = param [0, objNull, [objNull]];

if(remoteExecutedOwner != 2 || isNull _vehicle) exitWith {};

_vehicle addEventHandler ["Local", {
params ["_entity", "_isLocal"];
if(_isLocal) then {_entity setOwner HC_LIFE;};
}];