private _pSide = param [0, sideUnknown];
private _return = switch (_pSide) do {case east : {1};case west : {2};case civilian : {3};case independent : {4};};
_return;