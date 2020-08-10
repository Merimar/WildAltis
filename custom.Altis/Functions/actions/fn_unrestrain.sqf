private _unit = param [0, objNull];
if(isNull _unit) exitWith {};

_unit setVariable ["restrained", false, true];
_unit setVariable ["Escorting", false, true];
_unit setVariable ["transporting", false, true];
_unit setVariable ["execution", false, true];
detach _unit;

[0, format ["%1 hat %2 freigelassen", profileName, name _unit]] remoteExecCall ["life_fnc_broadcast", west];