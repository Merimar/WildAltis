private _vehicle = param [0, ""];
private _pSide = param [1, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};
private _price = 0;

private _buyMultiplier = [_pSide] call life_fnc_getBuyMultiplier;

if(isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicle)) then {
_price = (getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "price") / 2) * _buyMultiplier;
};

_price;