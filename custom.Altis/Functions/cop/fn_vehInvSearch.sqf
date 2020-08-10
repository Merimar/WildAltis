if(SEARCH_VEHICLE_TIMER) exitWith {};
[] spawn {SEARCH_VEHICLE_TIMER = true; sleep 10; SEARCH_VEHICLE_TIMER = false;};

["", "Durchsuche Fahrzeug ..."] spawn life_fnc_message;
life_action_inUse = true;
sleep 2;
life_action_inUse = false;
[player, _this select 0] remoteExec ["HC_fnc_vehicleInvSearch", HC_LIFE];