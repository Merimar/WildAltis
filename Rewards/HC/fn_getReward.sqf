private _pID = param [0, "", [""]];
private _rewardClass = param [1, "", [""]];

private _save = [getPlayerUID _unit] call HC_fnc_getSave;
private _currentRewards = _save select SAVE_STATE_INDEX param [23, [[], 0]] select 0;
private _rewardIndex = _currentRewards findIf {_x select == _rewardClass};

if(_rewardIndex isEqualTo -1) exitWith {false;};

private _return = _currentRewards select _rewardIndex select 1;
_return;