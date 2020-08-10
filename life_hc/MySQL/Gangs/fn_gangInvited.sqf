private _unit = param [0, objNull, [objNull]];
private _group = param [1, grpNull, [grpNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_gangInvited"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte einer Gang %4 beitreten, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit, _groupName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangInvite Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangInvite Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
private _groupMax = _gangInformation select 4;
private _gangMembers = _gangInformation select 6;
private _currentCount = count _gangMembers;

if(_groupMax <= _currentCount) exitWith {["", "Die Gang ist bereits voll!"] remoteExec ["life_fnc_message", _unit];};
[format["Der Spieler %1 ist deiner Gruppe beigetreten", name _unit], "Neuer Spieler"] remoteExec ["life_fnc_message", units _group];

[_unit] join _group;
_sideID = [side _unit] call HC_fnc_getSideID;
_gangMembers pushBack [name _unit, getPlayerUID _unit, _sideID];

_gMembers = _group getVariable ["gang_members", []];
_gMembers = _gMembers + [getPlayerUID _unit];
_group setVariable ["gang_members", _gMembers, true];

private _msg = format ["Der Spieler %1 (%2 - %3) ist der Gang %4 beigetreten", name _unit, getPlayerUID _unit, side _unit, _groupName];
["GangLog", _msg] call HC_fnc_Log;

private _query = format ["INSERT INTO player_gang (player_id, gang_id, side_id, level) VALUES ('%1', '%2', '%3', '0')", getPlayerUID _unit, _id, _sideID];
[_query, 1] call HC_fnc_asyncCall;