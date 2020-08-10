private _vehicle = param [0, ""];
private _pSide = param [1, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};

private _factionBuyMultiplier = [_pSide] call life_fnc_getBuyMultiplier;
private _vehiclePrice = (getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicle >> "price")) * _factionBuyMultiplier;
private _storageFee = (getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_storage_fee_multiplier")) * _vehiclePrice;

_storageFee;