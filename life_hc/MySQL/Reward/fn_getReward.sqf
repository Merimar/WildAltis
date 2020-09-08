private _pID = param [0, "", [""]];
private _rewardClass = param [1, "", [""]];

private _save = [getPlayerUID _unit] call HC_fnc_getSave;
private _currentRewards = _save select SAVE_STATE_INDEX param [23, [[], 0]] select 0;
private _rewardIndex = _currentRewards findIf {(_x select 0) == _rewardClass};

if(_rewardIndex isEqualTo -1) exitWith {false;};

_rewardInfo = _currentRewards select _rewardIndex;
private _return =  [_rewardInfo select 1, _rewardInfo select 2];
_return;