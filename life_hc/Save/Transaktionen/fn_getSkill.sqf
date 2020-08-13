private _pID = param [0, ""];
private _pSkill = param [1, ""];
private _resultIndex = 6;

if(_pID == "" || _pSkill == "") exitWith {0};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {0};

private _xp = (_saveState select SAVE_STATE_INDEX select _resultIndex) findIf {_x select 0 == _pSkill};
if(_xp isEqualTo -1) exitWith {0};
_xp = _saveState select SAVE_STATE_INDEX select _resultIndex select _xp select 1;
_xp;