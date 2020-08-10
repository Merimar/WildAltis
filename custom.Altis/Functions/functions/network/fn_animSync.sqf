/*
    File: fn_animSync.sqf
    Author:

    Description:

*/
private["_unit","_anim"];
_unit = [_this,0,ObjNull,[objNull]] call BIS_fnc_param;
_anim = [_this,1,"",[""]] call BIS_fnc_param;
_unit switchMove _anim;