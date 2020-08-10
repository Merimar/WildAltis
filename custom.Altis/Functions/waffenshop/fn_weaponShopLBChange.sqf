#include "..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 5000;
private _index = lbCurSel 5001;
private _amountCombo = _display displayCtrl 5003;
private _priceCtrl = _display displayCtrl 5004;
private _icon = _display displayCtrl 5006;

if(_index isEqualTo -1) exitWith {};
private _data = call compile (lbData [5001, _index]);
private _price = lbValue [5001, _index];

private _classname = _data select 0;
private _condition = _data select 1;
private _color = if(_price > CASH) then {"#F73B4C"} else {"#60F73B"};
private _itemInfo = [_classname] call life_fnc_fetchCfgDetails;
private _configPicture = _itemInfo select 2;
private _uniformLoad = (getContainerMaxLoad (uniform player)) - (["uniform"] call life_fnc_getMass);
private _vestLoad = (getContainerMaxLoad (vest player)) - (["vest"] call life_fnc_getMass);
private _backpackLoad = (getContainerMaxLoad (backpack player)) - (["backpack"] call life_fnc_getMass);
private _itemType = [_classname] call life_fnc_getItemType;
private _insMass = 0;

_priceCtrl ctrlSetStructuredText parseText format ["Preis: <t color='%1'>€%2</t>", _color, [_price] call life_fnc_numberText];
_icon ctrlSetText _configPicture;
lbClear _amountCombo;

private _itemWeightUpdate = getNumber (configfile >> "CfgWeapons" >> _classname >> "WeaponSlotsInfo" >> "mass");
if(_itemWeightUpdate isEqualTo 0) then {_itemWeightUpdate = getNumber (configfile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "mass");};
if(_itemWeightUpdate isEqualTo 0) then {_itemWeightUpdate = getNumber (configfile >> "CfgMagazines" >> _classname >> "mass");};
if(_itemWeightUpdate isEqualTo 0) exitWith {};

{_insMass = _insMass + floor (_x / _itemWeightUpdate);}forEach [_uniformLoad, _vestLoad, _backpackLoad];
if(!(_itemType in [3, 11])) then {_insMass = 1;};
_amountCombo ctrlEnable true;
for "_int" from 0 to _insMass step 1 do {_amountCombo lbAdd str _int;};

private _curSel = if(lbSize _amountCombo > 1) then {1} else {0};
_amountCombo lbSetCurSel _curSel;
_amountCombo ctrlEnable (_itemType in [3, 11] && _curSel isEqualTo 1);