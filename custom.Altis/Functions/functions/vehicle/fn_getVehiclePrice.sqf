private _vehicle = param [0, ""];
private _skin = param [1, ""];
private _folie = param [2, ""];
private _insurance = param [3, false];
private _pSide = param [4, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};

private _factionBuyMultiplier = [_pSide] call life_fnc_getBuyMultiplier;
private _vehiclePrice = (getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "price")) * _factionBuyMultiplier;

if(_skin != "-1" && _skin != "") then {
private _skinPrice = getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "textures" >> _skin >> "price");
_vehiclePrice = round (_vehiclePrice * _skinPrice);
};

if(_folie != "-1" && _folie != "") then {
private _materialPrice = getNumber (missionConfigFile >> "LifeCfgMaterials" >> _folie >> "price");
_vehiclePrice = round (_vehiclePrice * _materialPrice);
};

if(_insurance) then {_vehiclePrice = round (_vehiclePrice * 1.7);};
_vehiclePrice;