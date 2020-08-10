private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _type = param [2, "cash"];
private _resultIndex = 10;

if(_pID == "" || _pSide isEqualTo sideUnknown) exitWith {0;};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {0;};

private _money = [SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex, _type] call HC_fnc_getMoneyValue;
_money;