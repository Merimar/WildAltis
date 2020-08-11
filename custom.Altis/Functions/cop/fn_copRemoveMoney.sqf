private _geheimZahl = param [0, 0, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

CASH = 0;
["Deine illegalen Banknoten wurden von der Polizei beschlagnahmt!", "Geld abgenommen"] spawn life_fnc_message;