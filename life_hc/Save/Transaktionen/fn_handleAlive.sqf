private _pID = param [0, ""];
private _alive = param [1, false];
private _resultIndex = 8;

if(_pID == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

(_saveState select SAVE_STATE_INDEX select _resultIndex) set [0, _alive];