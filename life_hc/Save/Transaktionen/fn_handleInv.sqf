private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _gear = param [2, []];
private _resultIndex = 11;

if(_gear isEqualTo []) then {_gear = ["","","","","",[],"","",[],[],[],[],[],[],["","","","",""],["","","","",""]];};

if(_pID == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

(SAVE_ARRAY select _index select SAVE_STATE_INDEX) set [_resultIndex, _gear];