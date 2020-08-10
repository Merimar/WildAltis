if(LACKIERER_TIMER) exitWith {["Du kannst den Lackierer nur jede Minute benutzen", "Lackierer"] spawn life_fnc_message;};

[] spawn {
LACKIERER_TIMER = true;
sleep 60;
LACKIERER_TIMER = false;
};

[player] remoteExecCall ["HC_fnc_getLackiererVehicles",HC_Life];