#include "..\script_macros.hpp"
if(!life_canLoadout) exitWith {["Du kannst nur alle 60 Sekunden ein Loadout speichern.", "Loadout"] spawn life_fnc_message;};
if ((lbCurSel 3751) isEqualTo -1) exitWith {["Du hast keinen Slot ausgewählt.", "Loadout"] spawn life_fnc_message;};
private _curSel = (lbCurSel 3751) + 1;

private _flag = switch (playerSide) do {case civilian : {"reb_leicht"}; case east : {"reb_schwer"}; case west : {"cop"}; case independent : {"med"}};

private _unitloadout = getUnitLoadout player;
private _convertedloadout = _unitloadout call life_fnc_convertLoadout;

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
}forEach [[_convertedloadout select 3, "uniform"], [_convertedloadout select 4, "vest"], [_convertedloadout select 5, "backpack"], [_unitloadout select 7, "goggles"], [_unitloadout select 6, "headgear"], [_convertedloadout select 0, "weapons"], [_convertedloadout select 1, "weapons"], [_convertedloadout select 2, "weapons"]];

{
private _xItems = _x;
if(count _xItems > 0) then {
{
private _iteminfo = _x;
private _item = _iteminfo select 0;
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
}forEach [_convertedloadout select 12, _convertedloadout select 6, _convertedloadout select 7, _convertedloadout select 8, _convertedloadout select 9, _convertedloadout select 10, _convertedloadout select 11];

if(_bad) exitWith {["Du kannst einige Items auf diesem Loadout nicht erwerben!", "Nicht dein Level"] spawn life_fnc_message;};

private _loadout =  [_unitloadout, _curSel];
private _loadoutIndex = life_allLoadouts findIf {(_x select 1) isEqualTo _curSel};

if(_loadoutIndex isEqualTo -1) then {
life_allLoadouts pushBack _loadout;
}else {
life_allLoadouts set [_loadoutIndex, _loadout];
};

[player, _loadout] remoteExec ["HC_fnc_saveLoadout", HC_LIFE];
["Loadout erfolgreich gespeichert", "Loadout gespeichert"] spawn life_fnc_message;