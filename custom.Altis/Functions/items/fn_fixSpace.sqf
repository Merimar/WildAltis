private _value = 0;

{
private _item = _x select 0;
private _amount = _x select 1;
private _weight = [_item] call life_fnc_itemWeight;

_value = _value + (_amount * _weight);
}forEach life_virt_gear;

life_carryWeight = _value;