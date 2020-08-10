private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _pLevel = param [2, ""];
private _value = param [3, 0];
private _resultIndex = if(_pLevel == "alive") then {8} else {3};

if(_pID == "" || _pLevel == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

if(_pLevel == "alive") exitWith {
(SAVE_ARRAY select _index select SAVE_STATE_INDEX) set [_resultIndex, _value];
};

private _levelIndex = (SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex) findIf {_x select 0 == _pLevel};
(SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex select _levelIndex) set [1, _value];