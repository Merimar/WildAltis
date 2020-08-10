private _item = _this select 0;
private _amount = _this select 1;
private _autoAssign = _this select 2;

if(_autoAssign && _item in ["ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "ItemRadio", "Rangefinder", "Binocular"] && !(_item in assignedItems player)) exitWith {
player addWeapon _item;
};

private _itemWeightUpdate = getNumber (configfile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "mass");
if(_itemWeightUpdate isEqualTo 0) then {_itemWeightUpdate = getNumber (configfile >> "CfgWeapons" >> _item >> "ItemInfo" >> "mass");};
if(_itemWeightUpdate isEqualTo 0) then {_itemWeightUpdate = getNumber (configfile >> "CfgMagazines" >> _item >> "mass");};
if(_itemWeightUpdate isEqualTo 0) exitWith {};

private _uniformLoad = ["uniform"] call life_fnc_getMass;
private _uniformLoad = (getContainerMaxLoad (uniform player)) - _uniformLoad;
private _uniformSpace = floor (_uniformLoad / _itemWeightUpdate);

private _vestLoad = ["vest"] call life_fnc_getMass;
private _vestLoad = (getContainerMaxLoad (vest player)) - _vestLoad;
private _vestSpace = floor (_vestLoad / _itemWeightUpdate);

private _backpackLoad = ["backpack"] call life_fnc_getMass;
private _backpackLoad = (getContainerMaxLoad (backpack player)) - _backpackLoad;
private _backpackSpace = floor (_backpackLoad / _itemWeightUpdate);

for "_int" from 1 to _amount step 1 do {
if(_uniformSpace > 0) then {
player addItemToUniform _item;
_uniformSpace = _uniformSpace - 1;
}else {
if(_vestSpace > 0) then {
player addItemToVest _item;
_vestSpace = _vestSpace - 1;
}else {
player addItemToBackpack _item;
};
};
};