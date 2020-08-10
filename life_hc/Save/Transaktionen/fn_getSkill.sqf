private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _pSkill = param [2, ""];
private _resultIndex = 6;

if(_pID == "" || _pSkill == "" || _pSide isEqualTo sideUnknown) exitWith {0;};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {0;};

private _xp = (SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex) findIf {_x select 0 == _pSkill};
if(_xp isEqualTo -1) exitWith {0;};
_xp = SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex select _xp select 1;
_xp;