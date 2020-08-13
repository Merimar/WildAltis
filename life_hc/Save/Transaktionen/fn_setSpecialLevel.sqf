private _pID = param [0, ""];
private _pLevel = param [1, ""];
private _value = param [2, 0];
private _resultIndex = if(_pLevel == "alive") then {8} else {3};

if(_pID == "" || _pLevel == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

if(_pLevel == "alive") exitWith {(_saveState select SAVE_STATE_INDEX) set [_resultIndex, _value];};

private _levelIndex = (_saveState select SAVE_STATE_INDEX select _resultIndex) findIf {_x select 0 == _pLevel};
(_saveState select SAVE_STATE_INDEX select _resultIndex select _levelIndex) set [1, _value];