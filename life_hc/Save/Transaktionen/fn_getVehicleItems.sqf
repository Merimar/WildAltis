private _vehicle = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];

private _vUID = (_vehicle getVariable ["dbInfo", []]) param [2, -1];
if(_vUID isEqualTo -1 || _item == "" || isNull _vehicle) exitWith {0};

private _vehInvID = format ["VEHICLE_INV_%1", _vUID];
private _data = missionNamespace getVariable [_vehInvID, [[], 0]];
private _itemArray = _data select 0;

private _itemIndex = _itemArray findIf {_x select 0 == _item};
if(_itemIndex isEqualTo -1) then {_itemIndex = _itemArray pushBack [_item, 0];};

private _amount = _itemArray select _itemIndex select 1;
_amount;