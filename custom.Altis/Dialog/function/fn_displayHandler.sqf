/*
    File: fn_displayHandler.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master display handler
*/
private["_control","_code","_shift","_ctrlKey","_alt","_handled"];
_handled = false;

//Esc Key Handler
if ((_this select 1) in [1, 28, 156, 57]) then {_handled = true;};

_handled;
