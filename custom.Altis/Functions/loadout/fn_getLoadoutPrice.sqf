private _loadout = _this select 0;
private _pSide = param [1, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};

private _GesammtPreis = 0;
private _flag = switch(_pSide) do {case civilian:{"reb_leicht"};case east:{"reb_schwer"};case west:{"cop"};case independent:{"med"}};

private _convertedloadout = _loadout call life_fnc_convertLoadout;

{
private _item = _x select 0;
private _category = _x select 1;
private _configArray = getArray(missionConfigFile >> "CfgItemShop" >> _flag >> _category);
private _itemIndex = _configArray findIf {_x select 0 == _item};
if(_itemIndex != -1) then {
private _price = _configArray select _itemIndex select 2;
_GesammtPreis = _GesammtPreis + _price;
};
}forEach [[_convertedloadout select 3, "uniform"], [_convertedloadout select 4, "vest"], [_convertedloadout select 5, "backpack"], [_loadout select 7, "goggles"], [_loadout select 6, "headgear"], [_convertedloadout select 0, "weapons"], [_convertedloadout select 1, "weapons"], [_convertedloadout select 2, "weapons"]];

{
private _items = _x;
{
private _category = _x;
{
private _iteminfo = _x;
private _item = _iteminfo select 0;
private _configArray = getArray(missionConfigFile >> "CfgItemShop" >> _flag >> _category);
private _itemIndex = _configArray findIf {_x select 0 == _item};
if(_itemIndex != -1) then {
private _price = _configArray select _itemIndex select 2;
_GesammtPreis = _GesammtPreis + _price;
};
}forEach _items;
}forEach ["uniform", "vest", "backpack", "goggles", "headgear", "weapons", "items"];
}forEach [_convertedloadout select 12, _convertedloadout select 6, _convertedloadout select 7, _convertedloadout select 8, _convertedloadout select 9, _convertedloadout select 10, _convertedloadout select 11];

_GesammtPreis;