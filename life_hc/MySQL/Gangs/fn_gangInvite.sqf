private _unit = param [0, objNull, [objNull]];
private _invitePlayer = param [1, objNull, [objNull]];
private _group = param [2, grpNull, [grpNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_gangInvite"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group || isNull _invitePlayer) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _groupBank = _group getVariable ["gang_bank", 0];
private _groupMax = _group getVariable ["gang_maxMembers", 8];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte den Spieler %4 (%5 - %6) in seine Gang einladen, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit, name _invitePlayer, getPlayerUID _invitePlayer, side _invitePlayer];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangInvite Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangInvite Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
private _gangBank = _gangInformation select 5;

if(_gangBank != _groupBank || _gangBank < 10000) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte den Spieler %4 (%5 - %6) in seine Gang einladen, die Gang hat allerdings nicht genug Geld (%7 != %8)", name _unit, getPlayerUID _unit, side _unit, name _invitePlayer, getPlayerUID _invitePlayer, side _invitePlayer, [_groupBank] call HC_fnc_numberSafe, [_gangBank] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangInvite Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangInvite Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangMembers = _gangInformation select 6;
private _currentCount = count _gangMembers;

if(_groupMax <= _currentCount) exitWith {["", "Deine Gang ist voll!"] remoteExec ["life_fnc_message", _unit];};

private _newAmount = _gangBank - 10000;
_gangInformation set [5, _newAmount];
_group setVariable ["gang_bank", _newAmount, true];

private _msg = format ["Der Spieler %1 (%2 - %3) hat den  Spieler %4 (%5 - %6) in seine Gang %7 eingeladen", name _unit, getPlayerUID _unit, side _unit, name _invitePlayer, getPlayerUID _invitePlayer, side _invitePlayer, _groupName];
["GangLog", _msg] call HC_fnc_Log;

_query = format ["UPDATE gangs SET bank_balance = '%1' WHERE uid='%2' AND deleted_at IS NULL", _newAmount, _id];
[_query, 1] call HC_fnc_asyncCall;

[_unit, _group] remoteExec ["life_fnc_gangInvited", _invitePlayer];