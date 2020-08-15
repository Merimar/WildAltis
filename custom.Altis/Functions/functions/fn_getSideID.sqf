private _pSide = param [0, sideUnknown];
private _return = switch (_pSide) do {case east : {4};case west : {2};case civilian : {3};case independent : {1};};
_return;