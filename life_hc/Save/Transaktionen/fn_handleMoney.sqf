private _pID = param [0, ""];
private _type = param [1, "cash"];
private _amount = param [2, 0];
private _give = param [3, true];
private _resultIndex = 10;

if(_pID == "" || _type == "") exitWith {};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

private _money = [_pID, _type] call HC_fnc_getMoney;
private _newMoney = if(_give) then {_money + _amount} else {_money - _amount};
private _moneyIndex = (_saveState select SAVE_STATE_INDEX select _resultIndex) findIf {_x select 0 == _type};
if(_moneyIndex isEqualTo -1) exitWith {};

(_saveState select SAVE_STATE_INDEX select _resultIndex select _moneyIndex) set [1, _newMoney];