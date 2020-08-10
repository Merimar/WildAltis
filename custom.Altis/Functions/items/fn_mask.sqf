private _unit = param [0, objNull];

if(isNull _unit) exitWith {};

private _state = _unit getVariable ["mask", false];
private _text = if(_state) then {"Maske entfernt"} else {"Maske übergestülpt"};
_unit setVariable ["mask", !_state, true];

if(!_state) then {[] remoteExec ["life_fnc_checkMask", _unit];};
["", _text] spawn life_fnc_message;