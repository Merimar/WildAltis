private _pID = param [0, ""];
private _license = param [1, ""];
private _give = param [2, true];
private _resultIndex = 5;

if(_pID == "" || _license == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

private _licenses = [_pID] call HC_fnc_getLicenses;

if(_give) then {
(_saveState select SAVE_STATE_INDEX select _resultIndex) pushback _license;
}else {
private _licenseIndex = _licenses findIf {_x == _license};
if(_licenseIndex isEqualTo -1) exitWith {};
(_saveState select SAVE_STATE_INDEX select _resultIndex) deleteAt _licenseIndex;
};