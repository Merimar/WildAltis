private _pID = param [0, ""];
private _item = param [1, ""];
private _amount = param [2, 1];
private _give = param [3, false];
private _clear = param [4, false];
private _resultIndex = 12;

if(_pID == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

if(_clear) exitWith {(_saveState select SAVE_STATE_INDEX) set [_resultIndex, []];};

private _virt = [_pID] call HC_fnc_getVirt;
private _virtIndex = _virt findIf {_x select 0 == _item};

if(_virtIndex isEqualTo -1) exitWith {
if(!_give) exitWith {};
_virt pushBack [_item, _amount];
(_saveState select SAVE_STATE_INDEX) set [_resultIndex, _virt];
};

private _oldAmount = _virt select _virtIndex select 1;
private _newAmount = if(_give) then {_oldAmount + _amount} else {_oldAmount - _amount};
if(_newAmount < 0) then {_newAmount = 0;};

(_virt select _virtIndex) set [1, _newAmount];
(_saveState select SAVE_STATE_INDEX) set [_resultIndex, _virt];