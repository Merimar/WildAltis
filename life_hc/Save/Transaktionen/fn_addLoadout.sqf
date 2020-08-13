private _pID = param [0, ""];
private _pLoadout = param [1, []];
private _pIndex = param [2, 1];
private _resultIndex = 14;

if(_pID == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

private _loadouts = _saveState select SAVE_STATE_INDEX select _resultIndex;
private _loadoutIndex = _loadouts findIf {(_x select 1) isEqualTo _pIndex};

if(_loadoutIndex isEqualTo -1) then {
_loadouts pushBack _pLoadout;
}else {
_loadouts set [_loadoutIndex, _pLoadout];
};