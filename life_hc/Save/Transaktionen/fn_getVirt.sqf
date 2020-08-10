private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _resultIndex = 12;

if(_pID == "" || _pSide isEqualTo sideUnknown) exitWith {[];};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {[];};

private _virt = + (SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex);
_virt;