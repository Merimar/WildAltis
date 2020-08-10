_unit = param [0, objNull];
if(isNull _unit) exitWith {};
_drugs = if(_unit getVariable ["drugs", false]) then {"JA"} else {"NEIN"};
_promille = _unit getVariable ["promille", 0];
[format["<t color = '#ffcefe'>Name: %1<br/>Promille: %2<br/>Drogen konsumiert: %3", name _unit, _promille, _drugs], "Drogentest"] spawn life_fnc_message;