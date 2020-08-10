private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _type = param [2, "cash"];
private _amount = param [3, 0];
private _give = param [4, true];
private _resultIndex = 10;

if(_pID == "" || _type == "" || _pSide isEqualTo sideUnknown) exitWith {};

private _index = [_pID, _pSide] call HC_fnc_searchArray;
if(_index isEqualTo -1) exitWith {};

private _money = [_pID, _pSide, _type] call HC_fnc_getMoney;
private _newMoney = if(_give) then {_money + _amount} else {_money - _amount};
private _moneyIndex = (SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex) findIf {_x select 0 == _type};

(SAVE_ARRAY select _index select SAVE_STATE_INDEX select _resultIndex select _moneyIndex) set [1, _newMoney];