private _geheimZahl = param [0, -1, [0]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};
if(clientOwner in [2, HC_LIFE, 0]) exitWith {};

_handle = [] execVM "crash.sqf";