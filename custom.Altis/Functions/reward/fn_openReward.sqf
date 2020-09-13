disableSerialization;

if(isNull findDisplay 1500) then {createDialog "Rewards";};

private _display = findDisplay 1500;
private _rewardList = _display displayCtrl 1501;
private _progress = _display displayCtrl 1502;
private _counter = _display displayCtrl 1503;

private _allRewards = "true" configClasses (missionConfigFile >> "CfgRewards");

{
private _rewardClass = configName _x;
private _rewardTime = parseNumber((_rewardClass splitString "_") select 1);
private _rewardName = getText (_x >> "displayName");

private _picture = if(DAILY_REWARD_COUNTER >= (_forEachIndex + 1)) then {"Images\Dialog\RewardGet.paa"} else {"Images\Dialog\RewardGetNot.paa"};
private _color = if(DAILY_REWARD_COUNTER >= (_forEachIndex + 1)) then {[0.45, 1, 0.949, 1]} else {[0.964, 0.364, 0.019, 1]};
private _hasRedeemed = ({_x select 0 == _rewardClass && _x select 1} count DAILY_REWARD_LIST) isEqualTo 1;

if(_hasRedeemed) then {_picture = "Images\Dialog\RewardRedeemed.paa";};

_rewardList lbAdd format ["%1 [%2 Tage]", _rewardName, _rewardTime];
_rewardList lbSetData [_forEachIndex, _rewardClass];
_rewardList lbSetPicture [_forEachIndex, _picture];
_rewardList lbSetColor [_forEachIndex, _color];
}forEach _allRewards;

_rewardList lbSetCurSel (DAILY_REWARD_COUNTER - 1);

_counter ctrlSetText str DAILY_REWARD_COUNTER;
_progress progressSetPosition (DAILY_REWARD_COUNTER / count DAILY_REWARD_LIST);