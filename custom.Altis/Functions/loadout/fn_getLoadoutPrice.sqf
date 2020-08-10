private _loadout = _this select 0;
private _pSide = param [1, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};

private _GesammtPreis = 0;
private _flag = switch(_pSide) do {case civilian:{"reb_leicht"};case east:{"reb_schwer"};case west:{"cop"};case independent:{"med"}};

_loadout params ["_uniform", "_vest", "_backpack", "_goggles", "_headgear", ["_items",[]], "_prim", "_seco", ["_uItems",[]], ["_uMags",[]], ["_bItems",[]], ["_bMags",[]], ["_vItems",[]], ["_vMags",[]], ["_pItems",[]], ["_hItems",[]]];

{
private _item = _x select 0;
private _category = _x select 1;
private _configArray = getArray(missionConfigFile >> "CfgItemShop" >> _flag >> _category);
private _itemIndex = _configArray findIf {_x select 0 == _item};
if(_itemIndex != -1) then {
private _price = _configArray select _itemIndex select 2;
_GesammtPreis = _GesammtPreis + _price;
};
}forEach [[_uniform, "uniform"], [_vest, "vest"], [_backpack, "backpack"], [_goggles, "goggles"], [_headgear, "headgear"], [_prim, "weapons"], [_seco, "weapons"]];

{
private _items = _x;
{
private _category = _x;
{
private _item = _x;
private _configArray = getArray(missionConfigFile >> "CfgItemShop" >> _flag >> _category);
private _itemIndex = _configArray findIf {_x select 0 == _item};
if(_itemIndex != -1) then {
private _price = _configArray select _itemIndex select 2;
_GesammtPreis = _GesammtPreis + _price;
};
}forEach _items;
}forEach ["uniform", "vest", "backpack", "goggles", "headgear", "weapons", "items"];
}forEach [_items, _uItems, _uMags, _vItems, _vMags, _bItems, _bMags, _pItems, _hItems];

_GesammtPreis;