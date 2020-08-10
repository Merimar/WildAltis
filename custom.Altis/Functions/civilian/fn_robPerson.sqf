#include "..\script_macros.hpp"
/*
    File: fn_robPerson.sqf
    Author: Merimar

    Description:
    Gives the player money for robbing a person
*/
private _money = param [0, 0];
private _unit = param [1, objNull];
private _victim = param [2, objNull];
private _isRobber = param [3, false];
private _geheimZahl = param [4, -1, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

if(_isRobber) then {
CASH = CASH + _money;
["", format["Du hast dem Spieler %1 €%2 gestohlen", name _victim, [_money] call life_fnc_numberText]] spawn life_fnc_message;
}else {
CASH = CASH - _money;
["", format["Der Spieler %1 hat dir €%2 gestohlen", name _unit, [_money] call life_fnc_numberText]] spawn life_fnc_message;
};