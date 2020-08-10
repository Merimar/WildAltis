{
_event = _x getVariable ["event_join", false];
if(_event) then {
[] remoteExec ["life_fnc_remoteCountdown", _x];
};
}foreach playableUnits;

[] spawn {
sleep 6;
["", "Event startet in 15 Sekunden!"] remoteExec ["life_fnc_message", -2];
sleep 15;
["", "Es geht los!"] remoteExec ["life_fnc_message", -2];
};