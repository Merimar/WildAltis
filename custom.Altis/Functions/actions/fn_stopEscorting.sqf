private _unit = if(isNull (player getVariable ["escortingPlayer", objNull])) then {cursorTarget} else {player getVariable ["escortingPlayer", objNull]};
if(isNull _unit || {}) exitWith {!(_unit getVariable ["Escorting",false])};
detach _unit;
_unit setVariable ["Escorting", false, true];
player setVariable ["currentlyEscorting", nil];
player setVariable ["isEscorting", false];