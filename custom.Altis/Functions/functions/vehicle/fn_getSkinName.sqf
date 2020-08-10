private _vehicle = param [0, ""];
private _skin = param [1, ""];
private _skinName = "Standard";

if(isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "textures" >> _skin)) then {
_skinName = getText (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "textures" >> _skin >> "name");
};

_skinName;