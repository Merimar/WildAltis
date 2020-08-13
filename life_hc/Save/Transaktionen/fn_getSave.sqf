private _pID = param [0, ""];

private _arrayID = format ["SAVE_ARRAY_%1", _pID];
private _saveState = missionNamespace getVariable [_arrayID, []];
_saveState;