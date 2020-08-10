if(LAST_SAVE) exitWith {["", "Du kannst nur alle 5 Minuten deine Informationen mit dem Server synchronisieren."] spawn life_fnc_message;};

[] spawn {
LAST_SAVE = true;
sleep (5 * 60);
LAST_SAVE = false;
};

["", "Du hast deine Spielerinformationen mit dem Server synchronisiert!"] spawn life_fnc_message;

[player] remoteExec ["HC_fnc_save", HC_LIFE];