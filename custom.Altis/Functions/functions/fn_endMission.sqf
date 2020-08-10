private _reason = param [0, ""];
private _geheimZahl = param [1, -1, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

[_reason,false,true] call BIS_fnc_endMission;