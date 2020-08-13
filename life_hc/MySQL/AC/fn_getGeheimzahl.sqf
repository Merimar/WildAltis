private _pID = param [0, ""];

private _saveState = [_pID] call HC_fnc_getSave;
private _return = _saveState param [4, -1];
_return;