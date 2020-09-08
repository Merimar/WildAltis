_unit = param[0, objNull, [objNull]];
_rewardClass = param [1, "", [""]];

private _isHacker = [[_rewardClass], _unit, remoteExecutedOwner, "fn_valueClaim"] call HC_fnc_checkSQLBreak;
if(_isHacker || !(isClass (missionConfigFile >> "CfgRewards" >> _rewardClass))) exitWith {};

_pid = getPlayerUID _unit;

_query = format["UPDATE player_rewards SET valueclaimed = '1' WHERE player_id = '%1' AND reward = '%2'", _pid, _rewardClass];
[_query, 1] call HC_fnc_asyncCall;

private _save = [_pid] call HC_fnc_getSave;
private _currentRewards = _save select SAVE_STATE_INDEX select 23 select 0;
private _rewardIndex = _currentRewards findIf {(_x select 0) == _rewardClass};
(_currentRewards select _rewardIndex) set [2, true];