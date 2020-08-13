private _pID = param [0, ""];
private _gear = param [1, []];
private _resultIndex = 11;

if(_gear isEqualTo []) then {_gear = ["","","","","",[],"","",[],[],[],[],[],[],["","","","",""],["","","","",""]];};
if(_pID == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

(_saveState select SAVE_STATE_INDEX) set [_resultIndex, _gear];