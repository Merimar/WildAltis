#include "..\..\Functions\script_macros.hpp"
/*
    File: fn_wireTransfer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initiates the wire-transfer
*/
params [
    ["_value",0,[0]],
    ["_unit",objNull,[objNull]],
	["_geheimZahl",-1,[-1]]
];
if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

if(_value <= 0 || isNull _unit) exitWith {};
BANK = BANK + _value;

[format["Der Spieler %1 hat dir $%2 überwiesen.", name _unit, [_value] call life_fnc_numberText], "Neue Überweisung"] spawn life_fnc_message;