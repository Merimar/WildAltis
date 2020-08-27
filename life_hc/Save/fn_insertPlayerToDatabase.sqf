private _unit = param [0, objNull];

if(isNull _unit) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _pName = name _unit;

private _sideID = [_pSide] call HC_fnc_getSideID;
private _admins = ["76561198180462113", "76561199011486455", "76561198900496623", "76561198248597360"];
private _defaultAdmin = if(_pID in _admins) then {5} else {0};
private _defaultDonator = if(AUTO_PREMIUM != -1) then {AUTO_PREMIUM} else {0};
_defaultDonator = if(_pID in _admins) then {3} else {_defaultDonator};
private _defaultCop = if(_pID in _admins) then {10} else {0};
private _defaultMedic = if(_pID in _admins) then {9} else {0};

private _query = format ["INSERT INTO players (steam_id) VALUES ('%1')", _pID];
[_query, 1] call HC_fnc_asyncCall;

/*
private _query = format ["INSERT INTO rewards (player_id, next_seen) VALUES ('%1', 'now() + INTERVAL 1 DAY')", _pID];
[_query, 1] call HC_fnc_asyncCall;
*/

sleep 1;

for "_skillID" from 1 to 27 step 1 do {
_query = format ["INSERT INTO player_skills (player_id, skill_id, xp) VALUES ('%1', '%2', '%3')", _pID, _skillID, 0];
[_query, 1] call HC_fnc_asyncCall;
sleep 0.01;
};

for "_pSideX" from 1 to 4 step 1 do {
_query = format ["INSERT INTO player_alive (player_id, side_id, status) VALUES ('%1', '%2', '1')", _pID, _pSideX];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["INSERT INTO player_gear (player_id, side_id, gear) VALUES ('%1', '%2', '""%3""')", _pID, _pSideX, GEAR_FIRST_JOIN];
[_query, 1] call HC_fnc_asyncCall;

private _defaultLevel = switch (_pSideX) do {case 1 : {_defaultAdmin}; case 2 : {_defaultMedic}; case 3 : {_defaultCop}; case 4 : {_defaultDonator};};

_query = format ["INSERT INTO player_level (player_id, level_id, level) VALUES ('%1', '%2', '%3')", _pID, _pSideX, _defaultLevel];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["INSERT INTO player_loadouts (player_id, side_id, loadout) VALUES ('%1', '%2', '""[]""')", _pID, _pSideX];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["INSERT INTO player_playtimes (player_id, side_id, time) VALUES ('%1', '%2', '0')", _pID, _pSideX];
[_query, 1] call HC_fnc_asyncCall;
};

_query = format ["INSERT INTO player_money (player_id, side_id, type, amount) VALUES ('%1', '%2', '%3', '%4')", _pID, 1, "bank", BANK_FIRST_JOIN_MED];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["INSERT INTO player_money (player_id, side_id, type, amount) VALUES ('%1', '%2', '%3', '%4')", _pID, 2, "bank", BANK_FIRST_JOIN_COP];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["INSERT INTO player_money (player_id, side_id, type, amount) VALUES ('%1', '%2', '%3', '%4')", _pID, 3, "bank", BANK_FIRST_JOIN_CIV];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["INSERT INTO player_money (player_id, side_id, type, amount) VALUES ('%1', '%2', '%3', '%4')", _pID, 1, "cash", CASH_FIRST_JOIN_MED];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["INSERT INTO player_money (player_id, side_id, type, amount) VALUES ('%1', '%2', '%3', '%4')", _pID, 2, "cash", CASH_FIRST_JOIN_COP];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["INSERT INTO player_money (player_id, side_id, type, amount) VALUES ('%1', '%2', '%3', '%4')", _pID, 3, "cash", CASH_FIRST_JOIN_CIV];
[_query, 1] call HC_fnc_asyncCall;

{
private _xVehicle = _x select 0;
private _xColor = _x select 1;
private _xMaterial = _x select 2;
private _xInsurance = _x select 3;
private _vUID = round(random(100000000));
_query = format ["INSERT INTO vehicles (vuid, owner_id, side_id, classname_id, color_id, material_id, insurance) VALUES ('%1', '%2', '%3', (SELECT id FROM life_classnames WHERE classname = '%4'), (SELECT id FROM life_vehicle_colors WHERE color = '%5'), (SELECT id FROM life_vehicle_materials WHERE material = '%6'), '%7')", _vUID, _pID, _sideID, _xVehicle, _xColor, _xMaterial, _xInsurance];
[_query, 1] call HC_fnc_asyncCall;
}forEach VEHICLES_FIRST_JOIN;

if(count LICENSE_FIRST_JOIN > 0) then {
_query = format ["DELETE FROM player_licenses WHERE player_id = '%1'", _pID];
[_query, 1] call HC_fnc_asyncCall;

{
_query = format ["INSERT INTO player_licenses (player_id, license_id) VALUES ('%1', (SELECT id FROM life_licenses WHERE license = '%2'))", _pID, _x];
[_query, 1] call HC_fnc_asyncCall;
}forEach LICENSE_FIRST_JOIN;
};

if(count INV_FIRST_JOIN > 0) then {
_query = format ["DELETE FROM player_virtual_items WHERE player_id = '%1' AND side_id = '%2'", _pID, _sideID];
[_query, 1] call HC_fnc_asyncCall;

{
_query = format ["INSERT INTO player_virtual_items (player_id, side_id, item_id, amount) VALUES ('%1', '%2', (SELECT id FROM life_virtual_items WHERE name = '%3'), '%4')", _pID, _sideID, _x select 0, _x select 1];
[_query,1] call HC_fnc_asyncCall;
}forEach INV_FIRST_JOIN;
};

sleep 1;

[_unit] call HC_fnc_queryPlayer;

["ConnectionLog", format ["Der Spieler %1 (%2 - %3) hat den Server zum ersten Mal betreten", _pName, _pID, _pSide]] call HC_fnc_log;
[format ["A New Player has joined the server for the first time: %1", _pName], true] call HC_fnc_adminMessage;
private _hackList = bank_obj getVariable ["hack_list", []];
_hackList pushBack [_pName, "Neuer Spieler auf dem Server", "Ein neuer Spieler hat den Server betreten", "Das ist keine Hacking Nachricht, lediglich eine Vorsichtsmasnahme!", ""];
bank_obj setVariable ["hack_list", _hackList, true];