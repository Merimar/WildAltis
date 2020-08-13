private _pID = param [0, ""];
private _license = toLower param [1, ""];

if(_pID == "" || _license == "") exitWith {false};
private _licenses = [_pID] call HC_fnc_getLicenses;
private _return = _license in _licenses;
_return;