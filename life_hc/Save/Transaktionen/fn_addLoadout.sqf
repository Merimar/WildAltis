private _uID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _pLoadout = param [2, []];
private _pIndex = param [3, 1];
private _resultIndex = 14;

if(_pID == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

private _loadouts = SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex;
private _loadoutIndex = _loadouts findIf {(_x select 1) isEqualTo _pIndex};

if(_loadoutIndex isEqualTo -1) then {
_loadouts pushBack _pLoadout;
}else {
_loadouts set [_loadoutIndex, _pLoadout];
};