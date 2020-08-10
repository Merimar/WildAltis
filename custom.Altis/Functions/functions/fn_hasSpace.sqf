private _className = param [0, ""];
private _itemWeightUpdate = getNumber (configfile >> "CfgWeapons" >> _className >> "WeaponSlotsInfo" >> "mass");
if(_itemWeightUpdate isEqualTo 0) then {_itemWeightUpdate = getNumber (configfile >> "CfgWeapons" >> _className >> "ItemInfo" >> "mass");};
if(_itemWeightUpdate isEqualTo 0) then {_itemWeightUpdate = getNumber (configfile >> "CfgMagazines" >> _className >> "mass");};

private _uniformLoad = ["uniform"] call life_fnc_getMass;
private _vestLoad = ["vest"] call life_fnc_getMass;
private _backpackLoad = ["backpack"] call life_fnc_getMass;

private _uniformLoad = (getContainerMaxLoad (uniform player)) - _uniformLoad;
private _vestLoad = (getContainerMaxLoad (vest player)) - _vestLoad;
private _backpackLoad = (getContainerMaxLoad (backpack player)) - _backpackLoad;

private _insMass = 0;
if(_itemWeightUpdate > 0) then {
{
_curLoad = floor (_x / _itemWeightUpdate);
_insMass = _insMass + _curLoad;
}forEach [_uniformLoad, _vestLoad, _backpackLoad];
};

if(_className in ["ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "ItemRadio", "Rangefinder", "Binocular"] && !(_className in assignedItems player)) then {_insMass = 1;};
_insMass;