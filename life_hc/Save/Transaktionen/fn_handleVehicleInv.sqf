#include "\life_hc\hc_macros.hpp"
private _vehicle = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _amount = param [2, 0, [0]];
private _action = param [3, false, [false]];

private _vUID = (_vehicle getVariable ["dbInfo", []]) param [2, -1];
if(_vUID isEqualTo -1 || _item == "" || isNull _vehicle) exitWith {};

private _vehInvID = format ["VEHICLE_INV_%1", _vUID];
private _data = missionNamespace getVariable [_vehInvID, [[], 0]];
private _itemArray = _data select 0;
private _weight = _data select 0;

private _itemIndex = _itemArray findIf {_x select 0 == _item};

if(_itemIndex isEqualTo -1 && !_action) exitWith {};
if(_itemIndex isEqualTo -1) then {_itemIndex = _itemArray pushBack [_item, 0];};

private _curAmount = _itemArray select _itemIndex select 1;
private _itemWeight = (getNumber (missionConfigFile >> "Items" >> _item >> "weight")) * _amount;

if(_action) then {
_curAmount = _curAmount + _amount;
_weight = _weight + _itemWeight;
}else {
_curAmount = _curAmount - _amount;
_weight = _weight - _itemWeight;
if(_curAmount <= 0) then {_curAmount = 0;_weight = 0;};
};

(_itemArray select _itemIndex) set [1, _curAmount];
_data set [2, _weight];