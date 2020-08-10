private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _alive = param [2, false];
private _resultIndex = 8;

if(_pID == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

(SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex) set [0, _alive];