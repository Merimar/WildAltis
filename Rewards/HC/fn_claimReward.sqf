private _unit = param [0, objNull, [objNull]];
private _rewardClass = param [1, "", [""]];

private _isHacker = [[_rewardClass], _unit, remoteExecutedOwner, "fn_claimReward"] call HC_fnc_checkSQLBreak;
if(_isHacker || !(isClass (missionConfigFile >> "CfgRewards" >> _rewardClass))) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _pName = name _unit;

private _query = format["SELECT reward, claimed FROM player_rewards WHERE player_id = '%1'", _pID];
private _input = [_query, 2, true] call HC_fnc_asyncCall;

_query = format["SELECT counter FROM rewards WHERE player_id = '%1'", _pID];
private _counterQuery = [_query, 2] call HC_fnc_asyncCall;

private _inputIndex = _input findIf {_x select 0 == _rewardClass};
private _currentCounter = _counterQuery select 0;
private _canReward = if(_inputIndex != -1) then {_input select _inputIndex select 1} else {false};
private _rewardTime = getNumber (missionConfigFile >> "CfgRewards" >> _rewardClass >> "streak");

if(!_canReward) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte eine Belohung einlösen %4 hat diese Belohung aber schon eingelöst", _pName, _pID, _pSide, _rewardClass];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", _pName];
[_unit, "Reward Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format ["Bei dem Spieler %1 wurde ein Reward Hack festgestellt", _pName], false] call HC_fnc_adminMessage;
};

if(_rewardTime > _currentCounter) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte eine Belohung einlösen %4 hat diese Belohung noch nicht freigeschaltet", _pName, _pID, _pSide, _rewardClass];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", _pName];
[_unit, "Reward Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format ["Bei dem Spieler %1 wurde ein Reward Hack festgestellt", _pName], false] call HC_fnc_adminMessage;
};

private _save = [_pID] call HC_fnc_getSave;
private _currentRewards = _save select SAVE_STATE_INDEX select 23 select 0;
private _rewardIndex = _currentRewards findIf {_x select == _rewardClass};
(_currentRewards select _rewardIndex) set [1, true];

_query = format["INSERT INTO player_rewards (player_id, reward) VALUES ('%1', '%2')", _pID, _rewardClass];
[_query, 1] call HC_fnc_asyncCall;

private _msg = format ["Der Spieler %1 (%2 - %3) hat eine Belohung eingelöst: %4", _pName, _pID, _pSide, _rewardClass];
["RewardLog", _msg] call HC_fnc_Log;

//------------------------------------------------------------------------------------------------------------------------------------------------

private _rewardType = getText (missionConfigFile >> "CfgRewards" >> _rewardClass >> "type");
private _rewardValue = getArray (missionConfigFile >> "CfgRewards" >> _rewardClass >> "value");

private _reward = _rewardValue select 0;
private _amount = _rewardValue param [1, 1];

switch (_rewardType) do {
case "VEHICLE" : {
private _query = format ["INSERT INTO vehicles (vuid, owner_id, side_id, classname_id, color_id, material_id, insurance, active) VALUES ('%1', '%2', '%3', (SELECT id FROM life_classnames WHERE classname = '%4'), (SELECT id FROM life_vehicle_colors WHERE color = '%5'), (SELECT id FROM life_vehicle_materials WHERE material = '%6'), '%7', '%8')", round(random(100000000)), _pID, [_pSide] call HC_fnc_getSideID, _reward, "-1", "-1", 0, 0];
[_query, 1] call HC_fnc_asyncCall;
};
case "MONEY" : {[_pID, "bank", _reward, true] call HC_fnc_handleMoney;};
case "SKILL" : {[_pID, _reward, _amount] call HC_fnc_addSkill;};
case "VIRT" : {[_pID, _reward, _amount, true] call HC_fnc_handleVirt;};
};

[_geheimZahl, _rewardType, _rewardValue] remoteExec ["life_fnc_getReward", _unit];