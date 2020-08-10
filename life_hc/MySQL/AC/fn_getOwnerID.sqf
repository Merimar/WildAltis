private _pID = _this select 0;
private _pSide = _this select 1;

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {-1};
private _return = SAVE_ARRAY select _index select (SAVE_STATE_INDEX - 1);
_return;