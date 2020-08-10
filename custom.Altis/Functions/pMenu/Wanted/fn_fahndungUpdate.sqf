if(WANTED_TIMER) exitWith {["Du kannst die Fahndungsliste nur alle 5 Sekunden aktualisieren", "Fahndungsliste"] spawn life_fnc_message;};

[] spawn {
WANTED_TIMER = true;
sleep 5;
WANTED_TIMER = false;
};

[] remoteExec ["HC_fnc_fahndungUpdate", HC_LIFE];