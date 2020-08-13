private _pID = _this select 0;

private _saveState = [_pID] call HC_fnc_getSave;
private _return = _saveState param [3, -1];
_return;