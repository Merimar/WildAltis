private _unit = param [0, objNull, [objNull]];
private _kickPlayerArray = param [1, [], [[], objNull]];
private _group = param [2, grpNull, [grpNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_gangOfflineKick"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group || _kickPlayerArray isEqualTo []) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte einen Spieler aus seiner Gang werfen, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangOfflineKick Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangOfflineKick Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _pName = _kickPlayerArray select 0;
private _pID = _kickPlayerArray select 1;
private _pSideID = _kickPlayerArray select 2;

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
private _gangMembers = _gangInformation select 6;
private _permissions = _gangInformation select 7;

_gangIndex = _gangMembers findIf {_x select 1 == _pID && (_x select 2) isEqualTo _pSideID};
if(_gangIndex isEqualTo -1) exitWith {};
_gangMembers deleteAt _gangIndex;

private _permissionIndex = _permissions findIf {_x select 0 == _pID && (_x select 1) isEqualTo _pSideID};
if(_permissionIndex >= 0) then {_permissions deleteAt _permissionIndex;};

_group setVariable ["gang_members", (_group getVariable ["gang_members", []]) - [_pID], true];
_group setVariable ["gang_permissions", _permissions, true];

private _msg = format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) aus seiner Gang %7 geworfen", name _unit, getPlayerUID _unit, side _unit, _pName, _pID, _pSideID, _groupName];
["GangLog", _msg] call HC_fnc_Log;

private _query = format ["DELETE FROM player_gang WHERE player_id = '%1' AND side_id = '%2'", _pID, _pSideID];
[_query, 1] call HC_fnc_asyncCall;