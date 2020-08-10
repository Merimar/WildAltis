private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _pIndex = param [2, -1];
private _resultIndex = 14;

if(_pID == "" || _pSide isEqualTo sideUnknown) exitWith {[];};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {[];};

private _loadouts = SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex;
private _loadoutIndex = _loadouts findIf {(_x select 1) isEqualTo _pIndex};
if(_loadoutIndex isEqualTo -1) exitWith {[];};
private _noArray = + (_loadouts select _loadoutIndex);
_noArray;