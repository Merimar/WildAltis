#include "..\script_macros.hpp"
private _money = param [0, 0, [0]];
private _geheimZahl = param [1, -1, [0]];

if(isNil "life_geheimZahl") exitWith {};
if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

[0, format["Du hast einen Paycheck erhalten (€%1)", [_money] call life_fnc_numberText]] call life_fnc_broadcast;
BANK = BANK + _money;