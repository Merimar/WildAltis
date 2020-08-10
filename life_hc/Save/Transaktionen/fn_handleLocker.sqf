private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _pItem = param [2, ""];
private _pAmount = param [3, 1];
private _resultIndex = 13;

if(_pID == "" || _pItem == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

private _locker = SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex;
private _lockerIndex = _locker findIf {_x select 0 == _pItem};

if(_lockerIndex isEqualTo -1) then {
if(_pAmount < 0) exitWith {};
_locker pushBack [_pItem, _pAmount];
}else {
_oldAmount = _locker select _lockerIndex select 1;
(_locker select _lockerIndex) set [1, _oldAmount + _pAmount];
};