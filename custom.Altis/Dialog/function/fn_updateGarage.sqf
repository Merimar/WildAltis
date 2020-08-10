if(GARAGE_TIMER) exitWith {["Du kannst deine Fahrzeuge nur alle 30 Sekunden aktualisieren", "Garage"] spawn life_fnc_message;};

[] spawn {
GARAGE_TIMER = true;
sleep 30;
GARAGE_TIMER = false;
};

[player, VEHICLE_TYPE] remoteExecCall ["HC_fnc_getVehicles", HC_Life];