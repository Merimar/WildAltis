#include "..\script_macros.hpp"
/*
    File: fn_arrestAction.sqf
    Author:

    Description:
    Arrests the targeted person.
*/
private["_unit","_id"];
_unit = param [0,ObjNull,[ObjNull]];
_reason = _this select 1;
_time = _this select 2;
if (isNull _unit) exitWith {}; //Not valid
if (isNil "_unit") exitWith {}; //Not Valid
if (!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if (!isPlayer _unit) exitWith {}; //Not a human
if (!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ

[_unit,player,_time,_reason] remoteExec ["life_fnc_jail", _unit];
