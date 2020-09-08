private _unit = param [0, objNull, [objNull]];
private _rewardbox = param[1, objNull, [objNull]];
private _rewardClass = param [2, "", [""]];

private _isHacker = [[_rewardClass], _unit, remoteExecutedOwner, "fn_activateItemAbo"] call HC_fnc_checkSQLBreak;
if(_isHacker || !(isClass (missionConfigFile >> "CfgRewards" >> _rewardClass))) exitWith {};

private _pid = getPlayerUID _unit;
private _isEnabled = [_pid, _rewardClass] call HC_fnc_getReward;
if(_isEnabled select 0 && !(_isEnabled select 1)) then {
	_rewardarray = getArray (missionConfigFile >> "CfgRewards" >> _rewardClass >> "value");
	[_rewardarray, _rewardClass] remoteExec ["life_fnc_getItemAboReward", _unit];
};