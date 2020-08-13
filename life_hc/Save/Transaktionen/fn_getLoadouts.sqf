private _pID = param [0, ""];
private _pIndex = param [1, -1];
private _resultIndex = 14;

if(_pID == "") exitWith {[]};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {[]};

private _loadouts = _saveState select SAVE_STATE_INDEX select _resultIndex;
private _loadoutIndex = _loadouts findIf {(_x select 1) isEqualTo _pIndex};
if(_loadoutIndex isEqualTo -1) exitWith {[]};
private _noArray = + (_loadouts select _loadoutIndex);
_noArray;