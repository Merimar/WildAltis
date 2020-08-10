private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _pLevel = param [2, ""];
private _resultIndex = if(_pLevel == "alive") then {8} else {3};
private _defaultReturn = if(_pLevel == "alive") then {true} else {0};

if(_pID == "" || _pLevel == "" || _pSide isEqualTo sideUnknown) exitWith {_defaultReturn;};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {_defaultReturn;};
if(count (SAVE_ARRAY select _index select SAVE_STATE_INDEX) isEqualTo 0) exitWith {_defaultReturn};

if(_pLevel == "alive") exitWith {
private _alive = SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex select 0;
_alive;
};

private _level = [SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex, _pLevel] call HC_fnc_getMoneyValue;
_level;