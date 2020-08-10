_what = param [0, "uniform", [""]];
_massGetMass = 0;
_itemsGetMass = [];

if(_what == "uniform") then {
_itemsGetMass = uniformItems player;
};

if(_what == "vest") then {
_itemsGetMass = vestItems player;
};

if(_what == "backpack") then {
_itemsGetMass = backpackItems player;
};


{
_itemWeightgetMass = getNumber (configfile >> "CfgWeapons" >> _x >> "WeaponSlotsInfo" >> "mass");
if(_itemWeightgetMass isEqualTo 0) then {
_itemWeightgetMass = getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
};
if(_itemWeightgetMass isEqualTo 0) then {
_itemWeightgetMass = getNumber (configfile >> "CfgMagazines" >> _x >> "mass");
};
_massGetMass = _massGetMass + _itemWeightgetMass;
}forEach _itemsGetMass;

_massGetMass;