private _pID = param [0, ""];
private _jailTime = param [1, 0];
private _resultIndex = 9;

if(_pID == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

(_saveState select SAVE_STATE_INDEX) set [_resultIndex, [_jailTime]];