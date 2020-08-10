private _msg = param [0, "", [""]];
private _geheimZahl = param [1, -1, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

[_msg, "Affiliate"] spawn life_fnc_message;
BANK = BANK + 100000;