private _unit = param [0, objNull];
private _group = param [1, grpNull];
if(isNull _group) exitWith {};
private _groupName = _group getVariable ["gang_name", ""];

if(((group player) getVariable ["gang_name", ""]) != "") exitWith {};

_action = [format["Du hast eine Gangeinladung von %1 erhalten", name _unit], format["Gangeinladung zu %1", _groupName], "Beitreten", "Ablehnen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {["Du hast die Gangeinladung abgelehnt", "Einladung abgelehnt"] spawn life_fnc_message;};

[format["Du hast die Gangeinladung angenommen. Du trittst der Gang %1 bei", _groupName], "Einladung angenommen"] spawn life_fnc_message;
[player, _group] remoteExec ["HC_fnc_gangInvited", HC_LIFE];