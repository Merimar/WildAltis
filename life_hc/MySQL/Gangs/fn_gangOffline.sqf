private _unit = param [0, objNull, [objNull]];
private _group = param [1, grpNull, [grpNull]];

if(isNull _unit || isNull _group) exitWith {};

private _groupName = _group getVariable ["gang_name", ""];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 1 == _groupName};
if(_gangIndex isEqualTo -1) exitWith {};

private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _gangMembers = _gangInformation select 6;

[_gangMembers] remoteExec ["life_fnc_gangOfflineGet", _unit];