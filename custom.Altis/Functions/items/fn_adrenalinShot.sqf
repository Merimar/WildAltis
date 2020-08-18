if(LAST_ADRENALIN_SHOT) exitWith {["Du kannst dir nur jede Minute, aus gesundheitlichen Gründen, einen Shot geben.", "Adrenalinshot"] spawn life_fnc_message;};
if((time - LAST_DAMAGE_BULLET_TIMER) < 300) exitWith {["Du wurdest vor weniger als 5 Minuten angeschossen, der Adrenalinshot hat keine Wirkung bei diesen Wunden.", "Adrenalinshot"] spawn life_fnc_message;};
if(isNull objectParent player) exitWith {["Du kannst dir den Adrenalinshot nur in einem Fahrzeug geben.", "Adrenalinshot"] spawn life_fnc_message;};

[] spawn {
LAST_ADRENALIN_SHOT = true;
sleep 60;
LAST_ADRENALIN_SHOT = false;
};

["Der Adrenalinshot hat gewirkt, du wirst dich nun besser fühlen.", "Adrenalinshot"] spawn life_fnc_message;
[player] remoteExec ["HC_fnc_adrenalinShot", HC_LIFE];
[false, "adrenalinshot", 1] call life_fnc_handleInv;