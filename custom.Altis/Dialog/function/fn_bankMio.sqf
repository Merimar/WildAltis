#include "..\..\Functions\script_macros.hpp"
disableSerialization;
private _action = param [0, true];

private _value = if(_action) then {BANK} else {CASH};

private _max = if(_value > 999999) then {"999999"} else {str _value};
((findDisplay 3850) displayCtrl 3853) ctrlSetText _max;

/*
private _add = param [0, 1];
private _value = ctrlText 2706;
private _edit = (findDisplay 3850) displayCtrl 2706;
_value = parseNumber(_value);

switch (_add) do {
case 1 : {_value = _value + 99999;};
case 2 : {_value = _value + 499999;};
case 3 : {_value = _value + 999999;};
};


_mod = 3;
_digits = _value call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;

_modBase = _digitsCount % _mod;
_numberText = "";
{
    _numberText = _numberText + str _x;
    if ((_foreachindex - _modBase) % (_mod) isEqualTo 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + "";};
} forEach _digits;

_edit ctrlSetText _numberText;
*/