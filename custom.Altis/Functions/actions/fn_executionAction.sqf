private _unit = param [0, objNull];

if(isNull _unit || {player distance _unit > 3 || !isPlayer _unit}) exitWith {};

private _state = _unit getVariable ["execution", false];
_unit setVariable ["execution", !_state, true];
[player] remoteExec ["life_fnc_execution", _unit];