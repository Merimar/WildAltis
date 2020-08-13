private _pID = param [0, ""];

private _arrayID = format ["SAVE_ARRAY_%1", _pID];
private _saveState = missionNamespace getVariable [_arrayID, []];
diag_log format ["Save Get: %1", _saveState];
_saveState;