#include "..\script_macros.hpp"
private _action = param [0, false];
private _item = param [1, ""];
private _amount = param [2, 0];

if(_item == "" || _amount <= 0) exitWith {true;}; 

private _curAmount = [_item] call life_fnc_getItemValue;
private _itemWeight = [_item] call life_fnc_itemWeight;
private _freeSpace = life_maxWeight - life_carryWeight;
private _itemIndex = life_virt_gear findIf {_x select 0 == _item};

private _works = if(_action) then {_freeSpace >= (_itemWeight * _amount)} else {_curAmount >= _amount};
if(!_works) exitWith {false;};

private _newAmount = if(_action) then {_curAmount + _amount} else {_curAmount - _amount};
private _newWeight = if(_action) then {life_carryWeight + (_itemWeight * _amount)} else {life_carryWeight - (_itemWeight * _amount)};

if(_itemIndex isEqualTo -1) then {
if(_newAmount > 0) then {
life_virt_gear pushBack [_item, _newAmount];
};
}else {
(life_virt_gear select _itemIndex) set [1, _newAmount];
if(_newAmount isEqualTo 0) then {life_virt_gear deleteAt _itemIndex};
};

life_carryWeight = _newWeight;
true;