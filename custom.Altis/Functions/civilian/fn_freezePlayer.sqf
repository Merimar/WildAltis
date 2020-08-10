#include "..\script_macros.hpp"
private _admin = param [0, objNull];
private _geheimZahl = param [1, -1, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};
disableUserInput !userInputDisabled;