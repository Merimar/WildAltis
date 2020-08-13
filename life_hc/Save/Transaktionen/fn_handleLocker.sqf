private _pID = param [0, ""];
private _pItem = param [1, ""];
private _pAmount = param [2, 1];
private _resultIndex = 13;

if(_pID == "" || _pItem == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

private _locker = _saveState select SAVE_STATE_INDEX select _resultIndex;
private _lockerIndex = _locker findIf {_x select 0 == _pItem};

if(_lockerIndex isEqualTo -1) then {
if(_pAmount < 0) exitWith {};
_locker pushBack [_pItem, _pAmount];
}else {
_oldAmount = _locker select _lockerIndex select 1;
(_locker select _lockerIndex) set [1, _oldAmount + _pAmount];
};