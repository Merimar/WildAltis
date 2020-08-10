private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _license = param [2, ""];
private _give = param [3, true];
private _resultIndex = 5;

if(_pID == "" || _license == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

private _licenses = [_pID, _pSide] call HC_fnc_getLicenses;

if(_give) then {
(SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex) pushback _license;
}else {
private _licenseIndex = _licenses findIf {_x == _license};
if(_licenseIndex isEqualTo -1) exitWith {};
(SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex) deleteAt _licenseIndex;
};