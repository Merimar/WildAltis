#include "..\script_macros.hpp"
if(!life_canLoadout) exitWith {["Du kannst nur alle 60 Sekunden ein Loadout speichern.", "Loadout"] spawn life_fnc_message;};
if ((lbCurSel 3751) isEqualTo -1) exitWith {["Du hast keinen Slot ausgewählt.", "Loadout"] spawn life_fnc_message;};
private _curSel = (lbCurSel 3751) + 1;

private _flag = switch (playerSide) do {case civilian : {"reb_leicht"}; case east : {"reb_schwer"}; case west : {"cop"}; case independent : {"med"}};

private _uniform = uniform player;
private _vest = vest player;
private _backpack = backpack player;
private _goggles = goggles player;
private _headgear = headgear player;
private _items = assignedItems player;
private _prim = primaryWeapon player;
private _seco = handgunWeapon player;
private _uItems = (uniformItems player) select {!(_x in magazines player)};
private _uMags = (uniformItems player) select {(_x in magazines player)};
private _vItems = (vestItems player) select {!(_x in magazines player)};
private _vMags = (vestItems player) select {(_x in magazines player)};
private _bItems = (backpackItems player) select {!(_x in magazines player)};
private _bMags = (backpackItems player) select {(_x in magazines player)};
private _pMag = if(count primaryWeaponMagazine player isEqualTo 0) then {[]} else {primaryWeaponMagazine player};
private _hMag = if(count handgunMagazine player isEqualTo 0) then {[]} else {handgunMagazine player};
private _pItems = primaryWeaponItems player + _pMag;
private _hItems = handgunItems player + _hMag;
private _bad = false;

{
private _item = _x select 0;
private _category = _x select 1;
if(_item != "") then {
private _configArray = getArray (missionConfigFile >> "CfgItemShop" >> _flag >> _category);
private _itemIndex = _configArray findIf {_x select 0 == _item};
if(_itemIndex isEqualTo -1) exitWith {_bad = true;};
private _condition = _configArray select _itemIndex select 3;
if(!(call compile _condition)) exitWith {_bad = true;};
};
}forEach [[_uniform, "uniform"], [_vest, "vest"], [_backpack, "backpack"], [_goggles, "goggles"], [_headgear, "headgear"], [_prim, "weapons"], [_seco, "weapons"]];

{
private _xItems = _x;
if(count _xItems > 0) then {
{
private _item = _x;
if(_item != "") then {
private _notFound = true;
{
private _category = _x;
private _configArray = getArray (missionConfigFile >> "CfgItemShop" >> _flag >> _category);
private _itemIndex = _configArray findIf {_x select 0 == _item};
if(_itemIndex != -1) then {
_condition = _configArray select _itemIndex select 3;
_notFound = !(call compile _condition);
};
}forEach ["uniform", "vest", "backpack", "goggles", "headgear", "weapons", "items"];
if(_notFound) exitWith {_bad = true;};
};
}forEach _xItems;
};
}forEach [_items, _uItems, _uMags, _vItems, _vMags, _bItems, _bMags, _pItems, _hItems];

if(_bad) exitWith {["Du kannst einige Items auf diesem Loadout nicht erwerben!", "Nicht dein Level"] spawn life_fnc_message;};

private _loadout =  [[_uniform, _vest, _backpack, _goggles, _headgear, _items, _prim, _seco, _uItems, _uMags, _vItems, _vMags, _bItems, _bMags, _pItems, _hItems], _curSel];
private _loadoutIndex = life_allLoadouts findIf {(_x select 1) isEqualTo _curSel};

if(_loadoutIndex isEqualTo -1) then {
life_allLoadouts pushBack _loadout;
}else {
life_allLoadouts set [_loadoutIndex, _loadout];
};

[player, _loadout] remoteExec ["HC_fnc_saveLoadout", HC_LIFE];
["Loadout erfolgreich gespeichert", "Loadout gespeichert"] spawn life_fnc_message;