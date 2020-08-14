private _unit = param [0, objNull];
private _vehicle = param [1, objNull];
private _geheimZahl = param [2, -1, [0]];

if(isNull _unit || isNull _vehicle || !(alive _vehicle)) exitWith {};
if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};
if(_vehicle in life_vehicles) exitWith {};

life_vehicles pushBack _vehicle;

[format ["Der Spieler %1 hat dir einen Schlüssel für sein %2 gegeben", name _unit, getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")], "Schlüssel bekommen"] spawn life_fnc_message;