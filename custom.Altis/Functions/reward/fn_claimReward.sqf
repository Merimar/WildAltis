disableSerialization;

if(isNull findDisplay 1500) exitWith {};

private _display = findDisplay 1500;
private _rewardList = _display displayCtrl 1501;
private _claimBtn = _display displayCtrl 1505;

private _index = lbCurSel _rewardList;
if(_index isEqualTo -1) exitWith {};

_claimBtn ctrlEnable false;

private _rewardClass = _rewardList lbData _index;
private _rewardIndex = DAILY_REWARD_LIST findIf {_x select 0 == _rewardClass};
private _hasClaimed = DAILY_REWARD_LIST select _rewardIndex select 1;

if(_hasClaimed) exitWith {["Du hast diese Belohnung schon eingefordert!", "Reward Streak"] spawn life_fnc_message;};

DAILY_REWARD_LIST select _rewardIndex set [1, true];

diag_log "testsss";

[player, _rewardClass] remoteExec ["HC_fnc_claimReward", HC_LIFE];