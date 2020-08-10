private _vehicle = param [0, ""];
private _pSide = param [1, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};
private _price = 0;

if(isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicle)) then {
_price = (getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "price")) * (([_pSide] call life_fnc_getBuyMultiplier) / 2);
};

_price;