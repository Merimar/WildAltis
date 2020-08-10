private _number = param [0, 0];
private _mod = param [1, 3];

private _digits = _number call bis_fnc_numberDigits;
private _digitsCount = count _digits - 1;

private _modBase = _digitsCount % _mod;
private _numberText = "";
{
_numberText = _numberText + str _x;
if((_foreachindex - _modBase) % (_mod) isEqualTo 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + ",";};
} forEach _digits;

_numberText;