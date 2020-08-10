disableSerialization;
private _unit = param [0, objNull];

if(isNull _unit || {_unit distance player > 10 || {_unit getVariable ["isDead", false]} || !(alive _unit)}) exitWith {};

[player, _unit] remoteExec ["HC_fnc_ticketPlayer", HC_LIFE];