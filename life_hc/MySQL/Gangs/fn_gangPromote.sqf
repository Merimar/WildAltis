private _unit = param [0, objNull, [objNull]];
private _promotionPlayer = param [1, objNull, [objNull]];
private _group = param [2, grpNull, [grpNull]];
private _promotion = param [3, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_gangPromote"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _group || isNull _promotionPlayer) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte den Spieler %4 (%5 - %6) befördern, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit, name _promotionPlayer, getPlayerUID _promotionPlayer, side _promotionPlayer];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GangPromote Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GangPromote Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _id = _gangInformation select 0;
private _permissions = _gangInformation select 7;
private _sideID = [side _promotionPlayer] call HC_fnc_getSideID;
private _unitSideID = [side _unit] call HC_fnc_getSideID;

private _permissionIndex = _permissions findIf {_x select 0 == getPlayerUID _promotionPlayer && (_x select 1) isEqualTo _sideID};
if(_permissionIndex >= 0) then {_permissions deleteAt _permissionIndex;};

if(_promotion isEqualTo 6) then {
private _msg = format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) in der Gang %7 als neuen Leader bestimmt", name _unit, getPlayerUID _unit, side _unit, name _promotionPlayer, getPlayerUID _promotionPlayer, side _promotionPlayer, _groupName];
["GangLog", _msg] call HC_fnc_Log;

_group setVariable ["gang_owner", getPlayerUID _promotionPlayer, true];
_group setVariable ["gang_ownerName", name _promotionPlayer, true];

private _gangHouseArray = _gangInformation select 9;
if(count _gangHouseArray > 0) then {
private _houseObj = nearestObject [_gangHouseArray select 2, _gangHouseArray select 1];
if(isNull _houseObj) exitWith {};
private _gangInfo = _houseObj getVariable ["house_information", []];
_gangInfo set [2, getPlayerUID _promotionPlayer];
_houseObj setVariable ["house_information", _gangInfo, true];
};

_query = format ["UPDATE gangs SET owner_id='%1', owner_side_id='%2' WHERE uid='%3' AND deleted_at IS NULL", getPlayerUID _promotionPlayer, _sideID, _id];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["UPDATE player_gang SET level = '6' WHERE player_id = '%1' AND side_id = '%2' AND gang_id = '%3'", getPlayerUID _promotionPlayer, _sideID, _id];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["UPDATE player_gang SET level = '0' WHERE player_id = '%1' AND side_id = '%2' AND gang_id = '%3'", getPlayerUID _unit, _unitSideID, _id];
[_query, 1] call HC_fnc_asyncCall;

_permissionIndex = _permissions findIf {_x select 0 == getPlayerUID _unit && (_x select 1) isEqualTo _unitSideID};
if(_permissionIndex >= 0) then {_permissions deleteAt _permissionIndex;};
}else {
_permissions pushBack [getPlayerUID _promotionPlayer, _sideID, _promotion];
private _msg = format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) in der Gang %7 auf den Rang %8 befördert", name _unit, getPlayerUID _unit, side _unit, name _promotionPlayer, getPlayerUID _promotionPlayer, side _promotionPlayer, _groupName, _promotion];
["GangLog", _msg] call HC_fnc_Log;

_query = format ["UPDATE player_gang SET level = '%1' WHERE player_id = '%2' AND side_id = '%3'", _promotion, getPlayerUID _promotionPlayer, _sideID];
[_query, 1] call HC_fnc_asyncCall;
};

_group setVariable ["gang_permissions", _permissions, true];