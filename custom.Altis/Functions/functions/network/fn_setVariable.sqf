private _target = param [0, objNull, [objNull]];
private _arg = param [1, "", [""]];
private _value = param [2, 0];
private _side = param [3, sideUnknown, [sideUnknown]];

if(!(playerSide isEqualTo _side)) exitWith {};

_target setVariable [_arg, _value];