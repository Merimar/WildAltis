if(ABSTELLHOF_TIMER) exitWith {["Du kannst deine Fahrzeuge nur alle 30 Sekunden aktualisieren", "Abstellhof"] spawn life_fnc_message;};

[] spawn {
ABSTELLHOF_TIMER = true;
sleep 30;
ABSTELLHOF_TIMER = false;
};

[player] remoteExecCall ["HC_fnc_getAbstellhofVehicles", HC_Life];