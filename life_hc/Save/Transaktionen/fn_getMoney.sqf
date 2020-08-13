private _pID = param [0, ""];
private _type = param [1, "cash"];
private _resultIndex = 10;

if(_pID == "") exitWith {0};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {0};

private _money = [_saveState select SAVE_STATE_INDEX select _resultIndex, _type] call HC_fnc_getMoneyValue;
_money;