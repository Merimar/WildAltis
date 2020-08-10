if(JUNKYARD_TIMER) exitWith {["Du kannst deine Fahrzeuge nur alle 30 Sekunden aktualisieren.", "Schrottplatz"] spawn life_fnc_message;};

[] spawn {
JUNKYARD_TIMER = true;
sleep 30;
JUNKYARD_TIMER = false;
};

[player] remoteExecCall ["HC_fnc_getJunkyardVehicles", HC_Life];