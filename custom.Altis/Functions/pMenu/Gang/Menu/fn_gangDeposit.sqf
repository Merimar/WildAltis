#include "..\..\..\script_macros.hpp"
disableSerialization;
private _value = ctrlText 3853;
private _group = group player;
private _groupName = _group getVariable ["gang_name", ""];

_value = parseNumber(_value);
if(_groupName == "") exitWith {};
if(_value <= 0) exitWith {};
if(_value > BANK) exitWith {["Dafür hast du nicht genügend Geld", "Kein Geld"] spawn life_fnc_message;};
if((time - life_action_delay) < 5) exitWith {["Du kannst nur alle 5 Sekunden etwas einzahlen", "Nur alle 5 Sekunden"] spawn life_fnc_message;};
life_action_delay = time;

BANK = BANK - _value;

[player, _value] remoteExec ["HC_fnc_gangDeposit", HC_LIFE];
[format["Du hast €%1 auf das Gangkonto eingezahlt", [_value] call life_fnc_numberText], "Einzahlung"] spawn life_fnc_message;
[] call life_fnc_atmMenu;