private _pID = param [0, ""];
private _resultIndex = 5;

if(_pID == "") exitWith {[]};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {[]};

private _licenses = _saveState select SAVE_STATE_INDEX select _resultIndex;
private _noArray = + _licenses;
_noArray;