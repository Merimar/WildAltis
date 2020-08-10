#include "..\script_macros.hpp"
disableSerialization;

private _display = findDisplay 5050;
private _shopList = _display displayCtrl 5051;
private _unitList = _display displayCtrl 5052;
private _shopHeader = _display displayCtrl 5059;

lbClear _shopList;
lbClear _unitList;

private _shopName = getText (missionConfigFile >> "VirtualShops" >> life_shop_type >> "name");
private _shopItems = getArray (missionConfigFile >> "VirtualShops" >> life_shop_type >> "items");

_shopHeader ctrlSetText _shopName;

{
private _displayName = getText (missionConfigFile >> "Items" >> _x >> "name");
private _buyPrice = [_x, "buyPrice"] call life_fnc_getItemPrice;
private _sellPrice = [_x, "sellPrice"] call life_fnc_getItemPrice;
private _unitItemCount = [_x] call life_fnc_getItemValue;

if(_buyPrice > 0) then {
if(life_shop_type != "danger_sell") then {
_shopList lbAdd format ["%1 (€%2)", _displayName, [_buyPrice] call life_fnc_numberText];
_shopList lbSetData [(lbSize _shopList)-1, _x];
};
};

if(_unitItemCount > 0 && _sellPrice > 0) then {
if(life_shop_type != "danger_buy") then {
_unitList lbAdd format ["%1 (%2)", _displayName, _unitItemCount];
_unitList lbSetData [(lbSize _unitList)-1, _x];
};
};
}forEach _shopItems;