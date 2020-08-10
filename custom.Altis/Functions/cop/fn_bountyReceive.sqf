#include "..\script_macros.hpp"
private _val = param [0, 0, [0]];
private _total = param [1, 0, [0]];
private _geheimZahl = param [2, -1, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};

if (_val isEqualTo _total) then {
[format["Du hast ein Kopfgeld von €%1 für die Festnahme eines gesuchten Verbrechers erhalten.", [_total] call life_fnc_numberText], "Kopfgeld"] spawn life_fnc_message;
} else {
[format["Du hast ein Kopfgeld von €%1 für das Töten eines gesuchten Verbrechers erhalten. Für eine Festnahme hättest du €%2 bekommen!", [_val] call life_fnc_numberText, [_total] call life_fnc_numberText], "Kopfgeld"] spawn life_fnc_message;
};

BANK = BANK + _val;