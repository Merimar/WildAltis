if(remoteExecutedOwner != 2) exitWith {};
if(!hasInterface) exitWith {};
private _reason = param [0, "HeadlessClient", [""]];
["HeadlessClient", true, false] call BIS_fnc_endMission;