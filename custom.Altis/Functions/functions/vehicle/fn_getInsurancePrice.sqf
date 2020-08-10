private _vehicle = param [0, "", [""]];
private _skin = param [1, "", [""]];
private _folie = param [2, "", [""]];
private _pSide = param [3, sideUnknown];

if(_pSide isEqualTo sideUnknown) then {_pSide = playerSide;};

private _vehiclePriceMit = [_vehicle, _skin, _folie, true, _pSide] call life_fnc_getVehiclePrice;
private _vehiclePriceOhne = [_vehicle, _skin, _folie, false, _pSide] call life_fnc_getVehiclePrice;
private _return = _vehiclePriceMit - _vehiclePriceOhne;

_return;