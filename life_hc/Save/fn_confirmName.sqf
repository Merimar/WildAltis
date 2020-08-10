#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull];
private _ausweis = param [1, []];
private _sideID = [side _unit] call HC_fnc_getSideID;

if(isNull _unit || count _ausweis isEqualTo 0) exitWith {DEBUG_ARRAY pushBack format ["Unit null or count zero [confirmName]: %1", _this];};

private _query = format ["INSERT INTO player_names (player_id, side_id, name, first_name, last_name, postal_code, street, country, province, city, house_number) VALUES ('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8', '%9', '%10', '%11')", getPlayerUID _unit, _sideID, _ausweis select 0, _ausweis select 1, _ausweis select 2, _ausweis select 3, _ausweis select 4, _ausweis select 5, _ausweis select 6, _ausweis select 7, _ausweis select 8];
[_query, 1] call HC_fnc_asyncCall;

CURRENT_AUSWEIS_CREATE = CURRENT_AUSWEIS_CREATE - [getPlayerUID _unit];

sleep 1;

_index = [getPlayerUID _unit, side _unit] call HC_fnc_searchArray;
[getPlayerUID _unit, side _unit, remoteExecutedOwner, name _unit, _index] call HC_fnc_queryPlayer;