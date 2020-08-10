#include "\life_hc\hc_macros.hpp"
private _vehicle = _this select 0;
private _item = _this select 1;
private _amount = _this select 2;
private _action = _this select 3;

private _index = [_vehicle] call HC_fnc_getVehicleIndex;
if(_index isEqualTo -1) exitWith {};

private _data = VEHICLE_INV_ARRAY select _index;
private _inv = _data select 1;
private _weight = _data select 2;

private _itemIndex = [_inv, _item] call HC_fnc_getVehicleItemIndex;
if(_itemIndex isEqualTo -1 && !_action) exitWith {};
if(_itemIndex isEqualTo -1) then {_itemIndex = _inv pushBack [_item, 0];};

private _itemData = _inv select _itemIndex;
private _curAmount = _itemData select 1;

private _itemWeight = (getNumber (missionConfigFile >> "Items" >> _item >> "weight")) * _amount;

if(_action) then {
_curAmount = _curAmount + _amount;
_weight = _weight + _itemWeight;
}else {
_curAmount = _curAmount - _amount;
_weight = _weight - _itemWeight;
if(_curAmount <= 0) then {_curAmount = 0;_weight = 0;};
};

_itemData set [1, _curAmount];
_data set [2, _weight];

