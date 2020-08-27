private _pID = param [0, "", [""]];
private _allRewards = "true" configClasses (missionConfigFile >> "CfgRewards");

private _query = format["SELECT reward, claimed, valueclaimed FROM player_rewards WHERE player_id = '%1'", _pID];
private _input = [_query, 2, true] call HC_fnc_asyncCall;

_query = format["SELECT counter, last_seen, next_seen FROM rewards WHERE player_id = '%1'", _pID];
private _counterQuery = [_query, 2] call HC_fnc_asyncCall;

private _currentCounter = _counterQuery select 0;
private _lastSeen = _counterQuery select 1;
private _nextSeen = _counterQuery select 2;

private _yearLast = _lastSeen select 0;
private _monthLast = _lastSeen select 1;
private _dayLast = _lastSeen select 2;

private _yearNext = _nextSeen select 0;
private _monthNext = _nextSeen select 1;
private _dayNext = _nextSeen select 2;

private _february = if((_monthLast % 4) isEqualTo 0) then {28} else {29};
private _lastDay = [31, _february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
private _currentLastDay = _lastDay select (_monthLast - 1);

private _isNextDay = _yearLast isEqualTo _yearNext && _monthLast isEqualTo _monthNext && _dayLast isEqualTo _dayNext;
private _isSameDay = (_yearLast isEqualTo _yearNext && _monthLast isEqualTo _monthNext && _dayLast isEqualTo (_dayNext - 1)) || (_yearLast isEqualTo (_yearNext - 1) && _monthLast isEqualTo 12 && _monthNext isEqualTo 1 && _dayLast isEqualTo 31 && _dayNext isEqualTo 1) && (_yearLast isEqualTo _yearNext && _monthLast isEqualTo (_monthNext - 1) && _dayLast isEqualTo _currentLastDay);
private _isWrong = !_isSameDay && !_isNextDay;

_query = format["UPDATE rewards SET last_seen = now() WHERE player_id = '%1'", _pID];
[_query, 1] call HC_fnc_asyncCall;

if(_isWrong || _isNextDay) then {
_query = format["UPDATE rewards SET next_seen = 'now() + INTERVAL 1 DAY' WHERE player_id = '%1'", _pID];
[_query, 1] call HC_fnc_asyncCall;
};

if(_isWrong) then {
_query = format["DELETE FROM player_rewards WHERE player_id = '%1'", _pID];
[_query, 1] call HC_fnc_asyncCall;

_query = format["UPDATE rewards SET counter = '1' WHERE player_id = '%1'", _pID];
[_query, 1] call HC_fnc_asyncCall;

_query = format["UPDATE vehicles SET active = '0', deleted_at = now() WHERE owner_id = '%1' AND abo = '%2'", _pID, 1];
[_query, 1] call HC_fnc_asyncCall;

_currentCounter = 1;
_input = [];
};

if(_isNextDay) then {
_currentCounter = _currentCounter + 1;
_query = format["UPDATE rewards SET counter = '%1' WHERE player_id = '%2'", _currentCounter, _pID];
[_query, 1] call HC_fnc_asyncCall;
};

private _rewards = [];

{
private _rewardClass = configName _x;
private _rewardIndex = _input findIf {_x select 0 == _rewardClass};
if(_rewardIndex isEqualTo -1) then {_rewards pushBack [_rewardClass, false];}else {_rewards pushBack [_rewardClass, (_input select _rewardIndex select 1) isEqualTo 1, (_input select _rewardIndex select 2) isEqualTo 1];};
}forEach _allRewards;

private _output = [_rewards, _currentCounter];

_output;