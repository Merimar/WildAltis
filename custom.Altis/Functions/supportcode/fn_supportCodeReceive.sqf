#include "..\script_macros.hpp"
private _geheimZahl = param [0, -1, [0]];
private _amount = param [1, 0, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

BANK = BANK + _amount;
[format["Du hast einen Supportcode eingelöst und €%1 bekommen.", [_amount] call life_fnc_numberText], "Supportcode"] spawn life_fnc_message;