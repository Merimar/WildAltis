private _pID = param [0, ""];
private _resultIndex = 9;

if(_pID == "") exitWith {0};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {0};

private _time = _saveState select SAVE_STATE_INDEX select _resultIndex select 0;
_time;