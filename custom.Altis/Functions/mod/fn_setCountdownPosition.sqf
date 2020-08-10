_pos = getPos player;
bank_obj setVariable ["Countdown_Pos", _pos, true];
["Countdown Position erfolgreich gespeichert!", true, "slow"] call life_fnc_showNotification;