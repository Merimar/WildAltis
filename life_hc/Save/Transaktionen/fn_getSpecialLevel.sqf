private _pID = param [0, ""];
private _pLevel = param [1, ""];
private _resultIndex = if(_pLevel == "alive") then {8} else {3};
private _defaultReturn = if(_pLevel == "alive") then {true} else {0};

if(_pID == "" || _pLevel == "") exitWith {_defaultReturn};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {_defaultReturn};

if(_pLevel == "alive") exitWith {
private _alive = _saveState select SAVE_STATE_INDEX select _resultIndex select 0;
_alive;
};

private _level = [_saveState select SAVE_STATE_INDEX select _resultIndex, _pLevel] call HC_fnc_getMoneyValue;
_level;