private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _item = param [2, ""];
private _amount = param [3, 1];
private _give = param [4, false];
private _clear = param [5, false];
private _resultIndex = 12;

if(_pID == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

if(_clear) exitWith {(SAVE_ARRAY select _index select SAVE_STATE_INDEX) set [_resultIndex, []];};

private _virt = [_pID, _pSide] call HC_fnc_getVirt;
private _virtIndex = _virt findIf {_x select 0 == _item};

if(_virtIndex isEqualTo -1) exitWith {
if(!_give) exitWith {};
_virt pushBack [_item, _amount];
(SAVE_ARRAY select _index select SAVE_STATE_INDEX) set [_resultIndex, _virt];
};

private _oldAmount = _virt select _virtIndex select 1;
private _newAmount = if(_give) then {_oldAmount + _amount} else {_oldAmount - _amount};
if(_newAmount < 0) then {_newAmount = 0;};

(_virt select _virtIndex) set [1, _newAmount];
(SAVE_ARRAY select _index select SAVE_STATE_INDEX) set [_resultIndex, _virt];