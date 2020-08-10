#include "..\script_macros.hpp"
disableSerialization;

private _shopName = _this select 0;
private _shopConfig = _this select 1;

if(isNull findDisplay 5000) then {createDialog "WeaponShop";};
private _display = findDisplay 5000;
SHOP_CONFIG = _shopConfig;

private _header = _display displayCtrl 5008;
private _combo = _display displayCtrl 5002;
private _playerMoney = _display displayCtrl 5005;

_header ctrlSetText _shopName;
_playerMoney ctrlSetStructuredText parseText format ["Geld: <t color='#60F73B'>€%1</t>", [CASH] call life_fnc_numberText];

{
private _entryName = switch (_forEachIndex) do {case 0 : {"uniform"}; case 1 : {"headgear"}; case 2 : {"goggles"}; case 3 : {"vest"}; case 4 : {"backpack"}; case 5 : {"weapons"}; case 6 : {"items"};};
private _itemArray = getArray (missionConfigFile >> "CfgItemShop" >> _shopConfig >> _entryName);

if(count _itemArray != 0) then {
_combo lbAdd _x;
_combo lbSetValue [(lbSize _combo)-1, _forEachIndex];
};
}forEach ["Kleidung", "Kopfbedeckungen", "Sonnenbrillen", "Westen", localize "STR_Backpack", "Waffen", "Items"];

_combo lbSetCurSel 0;