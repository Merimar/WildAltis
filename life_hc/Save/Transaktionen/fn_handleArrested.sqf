private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _jailTime = param [2, 0];
private _resultIndex = 9;

if(_pID == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

(SAVE_ARRAY select _index select SAVE_STATE_INDEX) set [_resultIndex, [_jailTime]];