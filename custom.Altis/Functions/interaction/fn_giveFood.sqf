private _unit = param [0, objNull];

[format["Der Spieler %1 hat dir Essen und Trinken gegeben", name _unit], "Du hast Essen bekommen"] call life_fnc_message;
life_hunger = 100;
life_thirst = 100;
[] call life_fnc_hudUpdate;