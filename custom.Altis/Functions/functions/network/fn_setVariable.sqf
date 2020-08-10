private _target = _this select 0;
private _arg = _this select 1;
private _value = _this select 2;
private _side = _this select 3;

if(!(playerSide isEqualTo _side)) exitWith {};

_target setVariable [_arg, _value];