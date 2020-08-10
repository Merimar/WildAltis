private _vehicle = _this select 0;
private _item = _this select 1;
private _amount = 0;

private _index = [_vehicle] call HC_fnc_getVehicleIndex;
if(_index isEqualTo -1) exitWith {_amount;};

private _data = VEHICLE_INV_ARRAY select _index;
private _itemArray = _data select 1;

private _itemIndex = [_itemArray, _item] call HC_fnc_getVehicleItemIndex;
if(_itemIndex isEqualTo -1) then {
_itemIndex = _itemArray pushBack [_item, 0];
};
private _itemData = _itemArray select _itemIndex;
_amount = _itemData select 1;
_amount;