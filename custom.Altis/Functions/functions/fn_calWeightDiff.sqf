private _item = param [0, ""];
private _value = param [1, -1];
private _cWeight = param [2, -1];
private _mWeight = param [3, -1];

for "_int" from 0 to 1 step 0 do {
private _newWeight = _cweight + (([_item] call life_fnc_itemWeight) * _value);
if(_newWeight <= _mWeight || _value <= 0) exitWith {};
_value = _value - 1;
};

if(_value < 0) then {_value = 0;};

_value;