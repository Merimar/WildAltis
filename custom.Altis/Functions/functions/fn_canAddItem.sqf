private _classname = param [0, "", [""]];
private _where = param [1, "", [""]];

private _itemWeightUpdate = getNumber (configfile >> "CfgWeapons" >> _classname >> "WeaponSlotsInfo" >> "mass");
if(_itemWeightUpdate isEqualTo 0) then {_itemWeightUpdate = getNumber (configfile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "mass");};
if(_itemWeightUpdate isEqualTo 0) then {_itemWeightUpdate = getNumber (configfile >> "CfgMagazines" >> _classname >> "mass");};
if(_itemWeightUpdate isEqualTo 0) exitWith {false};

private _amount = switch (_where) do {
case "uniform" : {private _uniformLoad = (getContainerMaxLoad (uniform player)) - (["uniform"] call life_fnc_getMass);floor (_uniformLoad / _itemWeightUpdate);};
case "vest" : {private _vestLoad = (getContainerMaxLoad (vest player)) - (["vest"] call life_fnc_getMass);floor (_vestLoad / _itemWeightUpdate);};
case "backpack" : {private _backpackLoad = (getContainerMaxLoad (backpack player)) - (["backpack"] call life_fnc_getMass);floor (_backpackLoad / _itemWeightUpdate);};
default {
private _uniformLoad = (getContainerMaxLoad (uniform player)) - (["uniform"] call life_fnc_getMass);
private _vestLoad = (getContainerMaxLoad (vest player)) - (["vest"] call life_fnc_getMass);
private _backpackLoad = (getContainerMaxLoad (backpack player)) - (["backpack"] call life_fnc_getMass);
private _load = 0;
{_load = _load + floor (_x / _itemWeightUpdate);}forEach [_uniformLoad, _vestLoad, _backpackLoad];
_load;
};
};

private _return = _amount >= 1;
_return;