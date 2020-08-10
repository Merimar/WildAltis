#include "..\..\Functions\script_macros.hpp"
disableSerialization;
private _value = ctrlText 3853;
_value = parseNumber(_value);

if (_value < 100) exitWith {["Du musst mindestens €100 abheben", "Üngültige Eingabe"] spawn life_fnc_message;};
if (_value > BANK) exitWith {["Dafür hast du nicht genügend Geld", "Kein Geld"] spawn life_fnc_message;};

if ((time - life_action_delay) < 1) exitWith {};
life_action_delay = time;

CASH = CASH + _value;
BANK = BANK - _value;

[player, _value] remoteExec ["HC_fnc_bankWithdraw", HC_LIFE];
[format["Du hast €%1 von deinem Bankkonto abgehoben", [_value] call life_fnc_numberText], "Abhebung"] spawn life_fnc_message;
[] call life_fnc_atmMenu;