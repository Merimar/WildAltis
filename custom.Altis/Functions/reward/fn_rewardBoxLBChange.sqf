disableSerialization;

if(isNull findDisplay 1550) exitWith {};

private _display = findDisplay 1550;
private _rewardList = _display displayCtrl 1551;
private _activateBtn = _display displayCtrl 1552;

private _index = lbCurSel _rewardList;
if(_index isEqualTo -1) exitWith {};

private _rewardClass = _rewardList lbData _index;
private _rewardIndex = DAILY_REWARD_LIST findIf {_x select 0 == _rewardClass};
private _hasClaimed = DAILY_REWARD_LIST select _rewardIndex select 1;

private _rewardName = getText (missionConfigFile >> "CfgRewards" >> _rewardClass >> "displayName");
private _rewardTime = getNumber (missionConfigFile >> "CfgRewards" >> _rewardClass >> "streak");
private _rewardLevel = getNumber (missionConfigFile >> "CfgRewards" >> _rewardClass >> "level");
private _icon = getText (missionConfigFile >> "CfgRewards" >> _rewardClass >> "icon");
private _isArma = getNumber (missionConfigFile >> "CfgRewards" >> _rewardClass >> "isArma");
private _picture = if(_isArma isEqualTo 1) then {([_icon] call life_fnc_fetchCfgDetails) select 2} else {_icon};
private _redeemed = if(_hasClaimed) then {"Ja"} else {"Nein"};
private _redeemedPicture = if(_hasClaimed) then {"Images\Dialog\RewardGet.paa"} else {"Images\Dialog\RewardGetNot.paa"};

private _descriptionText = format ["<t size = '1.5px' color = '#B139BF'>Belohung:</t><br/><br/>    <t size = '1.0px' color = '#9F92A0'>%1</t>    <img image='%5' size='1'></img><br/><br/><t size = '1.5px' color = '#B139BF'>Streak:</t><br/><br/>    <t size = '1.0px' color = '#9F92A0'>%2 Tage hinereinander online sein</t><br/><br/><t size = '1.5px' color = '#B139BF'>Level:</t><br/><br/>    <t size = '1.0px' color = '#9F92A0'>%3</t><br/><br/><t size = '1.5px' color = '#B139BF'>Schon eingelöst?:</t><br/><br/>    <t size = '1.0px' color = '#9F92A0'>%4</t>    <img image='%6' size='1'></img>", _rewardName, _rewardTime, _rewardLevel, _redeemed, _picture, _redeemedPicture];
_description ctrlSetStructuredText parseText _descriptionText;
_claimBtn ctrlEnable (DAILY_REWARD_COUNTER >= (_index + 1) && !_hasClaimed);