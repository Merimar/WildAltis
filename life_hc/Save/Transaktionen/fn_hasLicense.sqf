private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _license = toLower param [2, ""];

if(_pID == "" || _license == "" || _pSide isEqualTo sideUnknown) exitWith {false;};
_licenses = [_pID, _pSide] call HC_fnc_getLicenses;
private _return = _license in _licenses;
_return;