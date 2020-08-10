private _vehicle = param [0, objNull];
if(isNull _vehicle) exitWith {};
private _space = 1;

private _used = (_vehicle getVariable ["Trunk", [[], 0]]) select 1;
private _weight = [typeOf _vehicle] call life_fnc_vehicleWeightCfg;

[_weight, _used];