private _money = param [0, 0, [0]];
private _geheimZahl = param [1, 0, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

[format ["Du hast €%1 für deinen Knochen bekommen!", [_money] call life_fnc_numberText], "Grabräuber"] spawn life_fnc_message;
CASH = CASH + _money;