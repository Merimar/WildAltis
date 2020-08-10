#include "..\..\Functions\script_macros.hpp"
disableSerialization;
private _value = ctrlText 3853;
_value = parseNumber(_value);

if (_value <= 0) exitWith {};
if (_value > CASH) exitWith {["Dafür hast du nicht genügend Geld", "Kein Geld"] spawn life_fnc_message;};

if ((time - life_action_delay) < 1) exitWith {};
life_action_delay = time;

CASH = CASH - _value;
BANK = BANK + _value;

[player, _value] remoteExec ["HC_fnc_bankDeposit", HC_LIFE];
[format["Du hast €%1 auf dein Bankkonto eingezahlt", [_value] call life_fnc_numberText], "Einzahlung"] spawn life_fnc_message;
[] call life_fnc_atmMenu;