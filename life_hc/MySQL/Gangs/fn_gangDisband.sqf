private _unit = param [0, objNull, [objNull]];
private _group = param [1, grpNull, [grpNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_gangDisband"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte seine Gang auflösen, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangDisband Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangDisband Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
_group setVariable ["gang_name", "", true];

[] remoteExec ["life_fnc_gangDisbanded", units _group];
PLAYER_GANG_ARRAY deleteAt _gangIndex;

private _msg = format ["Der Spieler %1 (%2 - %3) hat die Gang %4 aufgelöst", name _unit, getPlayerUID _unit, side _unit, _groupName];
["GangLog", _msg] call HC_fnc_Log;

_query = format ["UPDATE gangs SET deleted_at = now() WHERE uid = '%1' AND deleted_at IS NULL", _id];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["DELETE FROM player_gang WHERE gang_id = '%1'", _id];
[_query, 1] call HC_fnc_asyncCall;

private _gangHouseArray = _gangInformation select 9;
if(count _gangHouseArray > 0) then {
private _houseID = _gangHouseArray select 0;
_query = format ["UPDATE gang_houses SET deleted_at = now() WHERE gang_id = '%1' AND deleted_at IS NULL", _id];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["DELETE FROM house_upgrades WHERE house_id = '%1'", _houseID];
[_query, 1] call HC_fnc_asyncCall;

private _houseObj = nearestObject [_gangHouseArray select 2, _gangHouseArray select 1];
if(isNull _houseObj) exitWith {};
_houseObj setVariable ["house_bought", false, true];
_houseObj setVariable ["house_id", nil, true];
_houseObj setVariable ["house_information", nil, true];
_houseObj setVariable ["house_upgrades", nil, true];
};