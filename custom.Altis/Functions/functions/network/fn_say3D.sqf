/*
    File: fn_say3D.sqf
    Author: Bryan "Tonic" Boardwine

    Description: Pass your sounds that you want everyone nearby to hear through here.

    Example:   [_veh,"unlock"] remoteExec ["life_fnc_say3D",RANY];
*/
private _object = param [0, objNull, [objNull]];
private _sound = param [1, "", [""]];

if(isNull _object) exitWith {};
if(_sound isEqualTo "");

_object say3D _sound;