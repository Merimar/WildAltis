private _unit = param [0, objNull, [objNull]];
private _group = param [1, grpNull, [grpNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_gangLeave"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte seine Gang verlassen, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangLeave Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangLeave Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _type = if(side _unit isEqualTo civilian) then {"civ"} else {"reb"};
private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
private _gangMembers = _gangInformation select 6;
private _permissions = _gangInformation select 7;
private _sideID = [side _unit] call HC_fnc_getSideID;

private _gangIndex = _gangMembers findIf {_x select 1 == getPlayerUID _unit && (_x select 2) isEqualTo _sideID};
private _permissionIndex = _permissions findIf {_x select 0 == getPlayerUID _unit && (_x select 1) isEqualTo _sideID};

if(_gangIndex isEqualTo -1) exitWith {};
_gangMembers deleteAt _gangIndex;
if(_permissionIndex != -1) then {_permissions deleteAt _permissionIndex;};

_group setVariable ["gang_members", (_group getVariable ["gang_members", []]) - [getPlayerUID _unit], true];
_group setVariable ["gang_permissions", _permissions, true];

[_unit] join grpNull;

private _msg = format ["Der Spieler %1 (%2 - %3) hat die Gang %4 verlassen", name _unit, getPlayerUID _unit, side _unit, _groupName];
["GangLog", _msg] call HC_fnc_Log;

private _query = format ["DELETE FROM player_gang WHERE player_id = '%1' AND side_id = '%2'", getPlayerUID _unit, _sideID];
[_query, 1] call HC_fnc_asyncCall;