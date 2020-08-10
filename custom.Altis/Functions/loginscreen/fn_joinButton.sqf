LOGIN_SCREEN_STATUS = 1;
showChat true;

switch (playerSide) do {
    case west: {
        _handle = [] spawn life_fnc_initCop;
        waitUntil {scriptDone _handle};
    };
    case civilian: {
        _handle = [] spawn life_fnc_initCiv;
        waitUntil {scriptDone _handle};
    };
	case east: {
        _handle = [] spawn life_fnc_initCiv;
        waitUntil {scriptDone _handle};
    };
    case independent: {
        _handle = [] spawn life_fnc_initMedic;
        waitUntil {scriptDone _handle};
    };
};

[] spawn life_fnc_virtusTimer;
[] call life_fnc_spawnMenu;