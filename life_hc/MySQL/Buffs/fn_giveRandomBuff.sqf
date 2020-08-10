private _group = param [0, grpNull, [grpNull]];

if(isNull _group) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};
if(_gangIndex isEqualTo -1) exitWith {};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
private _gangBuffs = _gangInformation select 8;

private _config = "true" configClasses (missionConfigFile >> "CfgBuffs");
private _randomBuff = "";
private _buffAmount = 0;
private _check = _gangBuffs select {(_x select 1) >= 3};

if(count _check isEqualTo 6) exitWith {};

for "_int" from 0 to 1 step 0 do {
_randomBuff = configName (selectRandom _config);
private _buffIndex = _gangBuffs findIf {(_x select 0) == _randomBuff};
private _exit = false;
if(_buffIndex isEqualTo -1) then {
_gangBuffs pushBack [_randomBuff, 1];
_exit = true;
_buffAmount = 1;
}else {
private _amount = _gangBuffs select _buffIndex select 1;
if(_amount < 3) then {
(_gangBuffs select _buffIndex) set [1, _amount + 1];
_exit = true;
_buffAmount = _amount + 1;
};
};
if(_exit) exitWith {};
};

_group setVariable ["gang_buffs", _gangBuffs, true];

_query = format ["UPDATE gang_buffs SET amount = '%1' WHERE gang_id = '%2' AND buff_id = (SELECT id FROM life_buffs WHERE buff = '%3')", _buffAmount, _id, _randomBuff];
[_query, 1] call HC_fnc_asyncCall;

private _buffName = getText (missionConfigFile >> "CfgBuffs" >> _randomBuff >> "name");
[format ["Deine Gang hat einen Buff erhalten.<br/><br/>Buff: %1", _buffName], "Gangbuff erhalten"] remoteExec ["life_fnc_message", units _group];

private _log = format ["Die Gruppe %1 hat einen %2 Buff bekommen", _groupName, _buffName];
["GangLog", _log] call HC_fnc_Log;