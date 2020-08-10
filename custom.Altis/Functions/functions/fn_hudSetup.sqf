disableSerialization;

10 cutRsc ["playerHUD", "PLAIN", 2, false];
[] call life_fnc_hudUpdate;

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        [] call life_fnc_hudUpdate;
		sleep 5;
    };
};