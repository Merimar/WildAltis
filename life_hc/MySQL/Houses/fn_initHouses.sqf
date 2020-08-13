private _query = "SELECT gang_houses.id, gang_houses.gang_id, life_classnames.classname, gang_houses.position, gang_houses.position_garage FROM gang_houses LEFT JOIN life_classnames ON gang_houses.classname_id = life_classnames.id WHERE gang_houses.deleted_at IS NULL";
private _gangHouses = [_query, 2, true] call HC_fnc_asyncCall;

private _houses = [];

{
private _houseID = _x select 0;
private _gangID = _x select 1;
private _classname = _x select 2;
private _position = [_x select 3] call HC_fnc_mresToArray;
private _garagePosition = [_x select 4] call HC_fnc_mresToArray;
private _houseObj = nearestObject [_position, _classname];

_houses pushBack _houseObj;

private _doorCount = getNumber(configFile >> "CfgVehicles" >> (typeOf _houseObj) >> "numberOfDoors");
for "_int" from 0 to _doorCount step 1 do {_houseObj setVariable [format ["bis_disabled_Door_%1", _int], 1, true];};

_query = format["SELECT upgrade, amount FROM house_upgrades WHERE house_id = '%1'", _houseID];
private _gangHouseUpgrades = [_query, 2, true] call HC_fnc_asyncCall;

_query = format["SELECT name, owner_id FROM gangs WHERE uid = '%1'", _gangID];
private _gangInfo = [_query, 2] call HC_fnc_asyncCall;
private _gangInformation = [_gangID, _gangInfo select 0, _gangInfo select 1, _garagePosition];

_houseObj setVariable ["house_bought", true, true];
_houseObj setVariable ["house_id", _houseID, true];
_houseObj setVariable ["house_information", _gangInformation, true];
_houseObj setVariable ["house_upgrades", _gangHouseUpgrades, true];
}forEach _gangHouses;

_query = "SELECT player_houses.id, player_houses.owner_id, life_classnames.classname, player_houses.position, player_houses.garage_position FROM player_houses LEFT JOIN life_classnames ON player_houses.classname_id = life_classnames.id WHERE player_houses.deleted_at IS NULL";
private _playerHouses = [_query, 2, true] call HC_fnc_asyncCall;

{
private _houseID = _x select 0;
private _ownerID = _x select 1;
private _classname = _x select 2;
private _position = [_x select 3] call HC_fnc_mresToArray;
private _garagePosition = [_x select 4] call HC_fnc_mresToArray;
private _houseObj = nearestObject [_position, _classname];
private _gangInformation = [-2, "", _ownerID, _garagePosition];
_houses pushBack _houseObj;

private _doorCount = getNumber(configFile >> "CfgVehicles" >> (typeOf _houseObj) >> "numberOfDoors");
for "_int" from 0 to _doorCount step 1 do {_houseObj setVariable [format ["bis_disabled_Door_%1", _int], 1, true];};

_houseObj setVariable ["house_bought", true, true];
_houseObj setVariable ["house_id", _houseID, true];
_houseObj setVariable ["house_information", _gangInformation, true];
_houseObj setVariable ["house_upgrades", [], true];
_houseObj setVariable ["house_garage", _garagePosition, true];
}forEach _playerHouses;

bank_obj setVariable ["gang_houses", _houses, true];