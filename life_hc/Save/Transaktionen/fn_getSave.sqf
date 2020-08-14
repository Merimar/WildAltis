private _pID = param [0, ""];

private _arrayID = format ["SAVE_ARRAY_%1", _pID];
private _saveState = missionNamespace getVariable [_arrayID, [objNull, _pID, sideUnknown, 60000, -1, []]];
_saveState;