#include "..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 5000;
private _index = lbCurSel 5002;
private _list = _display displayCtrl 5001;
lbClear _list;

if(_index isEqualTo -1) exitWith {};
SHOP_FILTER = lbValue [5002, _index];

private _config = switch (SHOP_FILTER) do {
	case 0 : {(getArray(missionConfigFile >> "CfgItemShop" >> SHOP_CONFIG >> "uniform"));};
	case 1 : {(getArray(missionConfigFile >> "CfgItemShop" >> SHOP_CONFIG >> "headgear"));};
	case 2 : {(getArray(missionConfigFile >> "CfgItemShop" >> SHOP_CONFIG >> "goggles"));};
	case 3 : {(getArray(missionConfigFile >> "CfgItemShop" >> SHOP_CONFIG >> "vest"));};
	case 4 : {(getArray(missionConfigFile >> "CfgItemShop" >> SHOP_CONFIG >> "backpack"));};
	case 5 : {(getArray(missionConfigFile >> "CfgItemShop" >> SHOP_CONFIG >> "weapons"));};
	case 6 : {(getArray(missionConfigFile >> "CfgItemShop" >> SHOP_CONFIG >> "items"));};
};

BUY_COLOR = [1, 1, 1, 1];
DENY_COLOR = [1, 0, 0, 1];

{
private _className = _x select 0;
private _displayName = _x select 1;
private _buyPrice = _x select 2;
private _condition = call compile (_x select 3);

private _itemInfo = [_className] call life_fnc_fetchCfgDetails;
private _configName = _itemInfo select 1;
private _configPicture = _itemInfo select 2;

private _displayName = if(_displayName != "") then {_displayName} else {_configName};
_list lbAdd _displayName;
_list lbSetData [(lbSize _list)-1, str([_className, _condition])];
_list lbSetValue [(lbSize _list)-1, _buyPrice];
_list lbSetPicture [(lbSize _list)-1, _configPicture];

if(_condition) then {
_list lbSetColor [(lbSize _list)-1, BUY_COLOR];
}else {
_list lbSetColor [(lbSize _list)-1, DENY_COLOR];
};
}forEach _config;

_list lbSetCurSel 0;