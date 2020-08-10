private _group = param [0, grpNull];
private _buff = param [1, ""];

if(isNull _group) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _duration = getNumber(missionConfigFile >> "CfgBuffs" >> _buff >> "duration");
private _buffName = getText(missionConfigFile >> "CfgBuffs" >> _buff >> "name");
private _timeName = floor (_duration / 60);

private _index = ACTIVE_BUFFS pushBack [_groupName, _buff];

private _currentBuffs = _group getVariable ["gang_active_buffs", []];
_currentBuffs pushBack [_buff, time];
_group setVariable ["gang_active_buffs", _currentBuffs, true];

[format["Eure Gang hat einen %1 aktiviert. Ihr könnt nun seine Vorteile nutzen. Der Buff läuft nun %2 Minuten", _buffName, _timeName], "Buff aktiviert"] remoteExec ["life_fnc_message", units _group];

sleep _duration;

ACTIVE_BUFFS deleteAt _index;

if(isNull _group) exitWith {};
private _nameCheck = _group getVariable ["gang_name", ""];
if(_nameCheck != _groupName) exitWith {};

[format["Der %1 ist abgelaufen.", _buffName], "Buff vorbei"] remoteExec ["life_fnc_message", units _group];

_currentBuffs = _group getVariable ["gang_active_buffs", []];
private _index = _currentBuffs findIf {_x select 0 == _buff};
if(_index isEqualTo -1) exitWith {};
_currentBuffs deleteAt _index;
_group setVariable ["gang_active_buffs", _currentBuffs, true];