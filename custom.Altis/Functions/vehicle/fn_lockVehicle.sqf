private _vehicle = param [0, objNull];
private _state = param [1, 2];

if(isNull _vehicle || !(alive _vehicle)) exitWith {};

_vehicle lock _state;