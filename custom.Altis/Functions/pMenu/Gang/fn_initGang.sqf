if(playerSide in [west, independent]) exitWith {};
[player] join (createGroup playerSide);
if(count (life_gangData select 0) isEqualTo 0) exitWith {};

private _gangInfo = life_gangData select 0;
private _groupPermissions = life_gangData select 1;
private _groupBuffs = life_gangData select 2;
private _groupName = _gangInfo select 0;
private _groupOwner = _gangInfo select 1;
private _groupMax = _gangInfo select 2;
private _groupBank = _gangInfo select 3;
private _groupID = _gangInfo select 4;
private _groupOwnerName = _gangInfo select 5;
private _group = group player;

private _groupIndex = allGroups findIf {_x getVariable ["gang_name", ""] == _groupName && _x getVariable ["gang_owner", ""] == _groupOwner};

if(_groupIndex isEqualTo -1) then {
_group setVariable ["gang_name", _groupName, true];
_group setVariable ["gang_owner", _groupOwner, true];
_group setVariable ["gang_maxMembers", _groupMax, true];
_group setVariable ["gang_bank", _groupBank, true];
_group setVariable ["gang_permissions", _groupPermissions, true];
_group setVariable ["gang_ownerName", _groupOwnerName, true];
_group setVariable ["gang_buffs", _groupBuffs, true];
_group setVariable ["gang_id", _groupID, true];
_group setVariable ["gang_members", [getPlayerUID player], true];
}else {
_group = (allGroups select _groupIndex);
[player] join _group;

_curMembers = _group getVariable ["gang_members", []];
if(getPlayerUID player in _curMembers) exitWith {};
_curMembers pushBack (getPlayerUID player);
_group setVariable ["gang_members", _curMembers, true];
};