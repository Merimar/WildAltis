if(INSURANCE_TIMER) exitWith {["Du kannst deine Fahrzeuge nur alle 30 Sekunden aktualisieren", "Versicherung"] spawn life_fnc_message;};

[] spawn {
INSURANCE_TIMER = true;
sleep 30;
INSURANCE_TIMER = false;
};

[player] remoteExecCall ["HC_fnc_getInsuranceVehicles",HC_Life];