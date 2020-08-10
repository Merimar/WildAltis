private _crew = crew cursorObject;

{
_x setVariable ["transporting", false, true];
_x setVariable ["Escorting", false, true];
[] remoteExecCall ["life_fnc_pulloutVeh", _x];
}forEach _crew;