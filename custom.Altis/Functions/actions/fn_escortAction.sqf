#include "..\script_macros.hpp"
private _unit = param [0, objNull];

if(!(isNull (player getVariable ["escortingPlayer", objNull])) || isNull _unit || !isPlayer _unit || {player distance _unit > 3}) exitWith {};

_unit attachTo [player,[0.1,1.1,0]];
player setVariable ["escortingPlayer", _unit];
player setVariable ["isEscorting", true];
_unit setVariable ["transporting", false, true];
_unit setVariable ["Escorting", true, true];
player reveal _unit;

waitUntil {(!(_unit getVariable ["Escorting", false]))};
player setVariable ["escortingPlayer", nil];
player setVariable ["isEscorting", false];