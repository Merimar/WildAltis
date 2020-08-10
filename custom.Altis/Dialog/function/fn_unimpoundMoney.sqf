private _money = param [0, 0, [0]];
private _geheimZahl = param [1, -1, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

BANK = BANK - _money;