private _vehicle = param [0, "", [""]];
private _skin = param [1, "", [""]];
private _folie = param [2, "", [""]];
private _pSide = param [3, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};

private _vehiclePrice = [_vehicle, _skin, _folie, false, _pSide] call life_fnc_getVehiclePrice;
_vehiclePrice = round (_vehiclePrice * 0.9);
_vehiclePrice;