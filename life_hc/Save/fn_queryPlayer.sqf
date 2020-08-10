#include "\life_hc\hc_macros.hpp"
private _pID = param [0, ""];
private _pSide = param [1, sideUnknown];
private _ownerID = param [2, -1];
private _playerName = param [3, ""];
private _saveIndex = param [4, -1];
private _saveUnit = param [5, objNull];
private _result = [];
private _gangID = 9000000;
private _houseID = 9000000;
private _newGangHouse = [];
private _remoteObject = if(isNull _saveUnit) then {_ownerID} else {_saveUnit};

if(DEBUG) then {
diag_log format ["DEBUG [-1]: %1", _ownerID];
diag_log format ["DEBUG [-1]: %1", _saveUnit];
diag_log format ["DEBUG [-1]: %1", _remoteObject];
};

if(_ownerID isEqualTo -1) exitWith {DEBUG_ARRAY pushBack format ["OwnerID -1 [querryPlayer]: %1", _this];};

if(DEBUG) then {
diag_log format ["DEBUG [0]: %1", _this];
};

private _sideID = [_pSide] call HC_fnc_getSideID;
private _groupSideID = [_pSide] call HC_fnc_getGroupSideID;

if(DEBUG) then {
diag_log format ["DEBUG [1]: %1", _this];
};

/** BASIC INFORMATION **/
private _query = format["SELECT id, steam_id, created_at FROM players WHERE steam_id = '%1'", _pID];
private _infoQuery = [_query, 2] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [2]: %1", _this];
};

if(_infoQuery isEqualType "") exitWith {[_pID, _playerName, _pSide, _ownerID, _saveIndex] spawn HC_fnc_insertPlayerToDatabase;};
if(count _infoQuery isEqualTo 0) exitWith {[_pID, _playerName, _pSide, _ownerID, _saveIndex] spawn HC_fnc_insertPlayerToDatabase;};

if(DEBUG) then {
diag_log format ["DEBUG [3]: %1", _infoQuery];
};

/** PASSPORT **/
_query = format["SELECT name, first_name, last_name, postal_code, street, country, province, city, house_number FROM player_names WHERE player_id = '%1' AND side_id = '%2' AND deleted_at IS NULL", _pID, _sideID];
private _passportQuery = [_query, 2] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [4]: %1", _passportQuery];
};

if(_passportQuery isEqualType "") exitWith {sleep 3;[] remoteExec ["SOCK_fnc_firstJoin", _remoteObject];CURRENT_AUSWEIS_CREATE pushBack _pID;};
if(count _passportQuery isEqualTo 0) exitWith {sleep 3;[] remoteExec ["SOCK_fnc_firstJoin", _remoteObject];CURRENT_AUSWEIS_CREATE pushBack _pID;};

if(DEBUG) then {
diag_log format ["DEBUG [5]: %1", "Nach Passport"];
};

/** LEVELS **/
_query = format["SELECT life_levels.name, player_level.level FROM player_level LEFT JOIN life_levels ON player_level.level_id = life_levels.id WHERE player_level.player_id = '%1'", _pID];
private _levelQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [6]: %1", _levelQuery];
};

/** PLAYTIME **/
_query = format["SELECT time FROM player_playtimes WHERE player_id = '%1'", _pID];
private _playtimeQuery = [_query, 2, true] call HC_fnc_asyncCall;
if(DEBUG) then {
diag_log format ["DEBUG [7]: %1", _playtimeQuery];
};
private _playtimeQuery = [_playtimeQuery, 0] call HC_fnc_multiArrayToArray;

if(DEBUG) then {
diag_log format ["DEBUG [8]: %1", _playtimeQuery];
};

/** LICENSES **/
_query = format["SELECT life_licenses.license FROM player_licenses LEFT JOIN life_licenses ON player_licenses.license_id = life_licenses.id WHERE player_licenses.player_id = '%1'", _pID];
private _licenseQuery = [_query, 2, true] call HC_fnc_asyncCall;
if(DEBUG) then {
diag_log format ["DEBUG [9]: %1", _licenseQuery];
};
private _licenseQuery = [_licenseQuery, 0] call HC_fnc_multiArrayToArray;

if(DEBUG) then {
diag_log format ["DEBUG [10]: %1", _licenseQuery];
};

/** SKILLS **/
_query = format["SELECT life_skills.skill, player_skills.xp FROM player_skills LEFT JOIN life_skills ON player_skills.skill_id = life_skills.id WHERE player_skills.player_id = '%1'", _pID];
private _skillsQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [11]: %1", _skillsQuery];
};

/** PLAYER HOUSES **/
_query = format["SELECT player_houses.id, life_classnames.classname, player_houses.position, player_houses.garage_position  FROM player_houses LEFT JOIN life_classnames ON player_houses.classname_id = life_classnames.id WHERE player_houses.owner_id = '%1' AND player_houses.deleted_at IS NULL", _pID];
private _houseQuery = [_query, 2, true] call HC_fnc_asyncCall;
if(DEBUG) then {
diag_log format ["DEBUG [12]: %1", _houseQuery];
};
private _newHouses = [];
{
private _houseID = _x select 0;
private _classname = _x select 1;
private _position = [_x select 2] call HC_fnc_mresToArray;
private _garagePosition = [_x select 3] call HC_fnc_mresToArray;
if(_position isEqualType "") then {_position = call compile format ["%1", _position]};
if(_garagePosition isEqualType "") then {_garagePosition = call compile format ["%1", _garagePosition]};
_newHouses pushBack [_houseID, _classname, _position, _garagePosition];
}forEach _houseQuery;

if(DEBUG) then {
diag_log format ["DEBUG [13]: %1", _newHouses];
};

/** ALIVE **/
_query = format["SELECT status FROM player_alive WHERE player_id = '%1' AND side_id = '%2'", _pID, _sideID];
private _aliveQuery = [_query, 2] call HC_fnc_asyncCall;
if(DEBUG) then {
diag_log format ["DEBUG [14]: %1", _aliveQuery];
};
_aliveQuery = if((_aliveQuery select 0) isEqualTo 0) then {[false]} else {[true]};

if(DEBUG) then {
diag_log format ["DEBUG [15]: %1", _aliveQuery];
};

/** JAIL **/
_query = format["SELECT duration FROM player_jail WHERE prisoner_id = '%1' AND side_id = '%2' AND deleted_at IS NULL", _pID, _sideID];
private _jailQuery = [_query, 2] call HC_fnc_asyncCall;
if(DEBUG) then {
diag_log format ["DEBUG [16]: %1", _jailQuery];
};
if(count _jailQuery isEqualTo 0) then {_jailQuery = [0]};

if(DEBUG) then {
diag_log format ["DEBUG [17]: %1", _jailQuery];
};

/** MONEY **/
_query = format["SELECT player_money.type, player_money.amount FROM player_money WHERE player_money.player_id = '%1' AND player_money.side_id = '%2'", _pID, _groupSideID];
private _moneyQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [18]: %1", _moneyQuery];
};

/** GEAR **/
_query = format["SELECT gear FROM player_gear WHERE player_id = '%1' AND side_id = '%2'", _pID, _sideID];
private _gearQuery = [_query, 2] call HC_fnc_asyncCall;
if(DEBUG) then {
diag_log format ["DEBUG [19]: %1", _gearQuery];
};
_gearQuery = [_gearQuery select 0] call HC_fnc_mresToArray;
if(DEBUG) then {
diag_log format ["DEBUG [20]: %1", _gearQuery];
};
if(_gearQuery isEqualType "") then {_gearQuery = call compile format["%1", _gearQuery];};

if(DEBUG) then {
diag_log format ["DEBUG [21]: %1", _gearQuery];
};

/** VIRT GEAR **/
_query = format["SELECT life_virtual_items.name, player_virtual_items.amount FROM player_virtual_items LEFT JOIN life_virtual_items ON player_virtual_items.item_id = life_virtual_items.id WHERE player_virtual_items.player_id = '%1' AND player_virtual_items.side_id = '%2'", _pID, _sideID];
private _virtQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [22]: %1", _virtQuery];
};

/** LOCKER **/
_query = format["SELECT life_classnames.classname, player_locker.amount FROM player_locker LEFT JOIN life_classnames ON player_locker.classname_id = life_classnames.id WHERE player_locker.player_id = '%1' AND player_locker.side_id = '%2'", _pID, _sideID];
private _lockerQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [23]: %1", _lockerQuery];
};

/** LOADOUT **/
_query = format["SELECT loadout FROM player_loadouts WHERE player_id = '%1' AND side_id = '%2'", _pID, _sideID];
private _loadoutQuery = [_query, 2] call HC_fnc_asyncCall;
if(DEBUG) then {
diag_log format ["DEBUG [24]: %1", _loadoutQuery];
};
_loadoutQuery = [_loadoutQuery select 0] call HC_fnc_mresToArray;
if(DEBUG) then {
diag_log format ["DEBUG [25]: %1", _loadoutQuery];
};
if(_loadoutQuery isEqualType "") then {_loadoutQuery = call compile format["%1", _loadoutQuery];};
if(DEBUG) then {
diag_log format ["DEBUG [26]: %1", _loadoutQuery];
};

/** AFFILIATE **/
_query = format["SELECT code FROM player_affiliate_codes WHERE player_id = '%1'", _pID];
private _affiliateQuery = [_query, 2] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [27]: %1", _affiliateQuery];
};

/** AFFILIATE PLAYERS **/
_query = format["SELECT player_names.name, player_affiliate_referrals.referrer_id FROM player_affiliate_referrals LEFT JOIN player_names ON player_names.player_id = player_affiliate_referrals.referrer_id WHERE player_affiliate_referrals.owner_id = '%1' AND player_names.side_id = '3'", _pID];
private _affiliatePlayersQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [28]: %1", _affiliatePlayersQuery];
};

/** GANG **/
_query = format["SELECT gangs.name, gangs.owner_id, gangs.max_members, gangs.bank_balance, gangs.uid FROM player_gang LEFT JOIN gangs ON player_gang.gang_id = gangs.uid WHERE player_gang.player_id = '%1' AND player_gang.side_id = '%2' AND gangs.deleted_at IS NULL", _pID, _sideID];
private _gangInfoQuery = [_query, 2] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [29]: %1", _gangInfoQuery];
};

if(!(_gangInfoQuery isEqualType "") && {count _gangInfoQuery > 0}) then {
_gangID = _gangInfoQuery select 4;
};

/** GANG PERMISSIONS **/
_query = format["SELECT player_gang.player_id, player_gang.side_id, player_gang.level FROM player_gang WHERE player_gang.gang_id = '%1'", _gangID];
private _gangPermissionsQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [30]: %1", _gangPermissionsQuery];
};

/** GANG BUFFS **/
_query = format["SELECT life_buffs.buff, gang_buffs.amount FROM gang_buffs LEFT JOIN life_buffs ON gang_buffs.buff_id = life_buffs.id WHERE gang_buffs.gang_id = '%1'", _gangID];
private _gangBuffsQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [31]: %1", _gangBuffsQuery];
};

/** GANG HOUSE **/
_query = format["SELECT gang_houses.id, life_classnames.classname, gang_houses.position, gang_houses.position_garage, gang_houses.battery FROM gang_houses LEFT JOIN life_classnames ON gang_houses.classname_id = life_classnames.id WHERE gang_houses.gang_id = '%1' AND gang_houses.deleted_at IS NULL", _gangID];
private _gangHouseQuery = [_query, 2] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [32]: %1", _gangHouseQuery];
};

if(!(_gangHouseQuery isEqualType "" || {count _gangHouseQuery isEqualTo 0})) then {
_houseID = _gangHouseQuery select 0;
private _classname = _gangHouseQuery select 1;
private _position = [_gangHouseQuery select 2] call HC_fnc_mresToArray;
private _garagePosition = [_gangHouseQuery select 3] call HC_fnc_mresToArray;
private _battery = _gangHouseQuery select 4;
if(_position isEqualType "") then {_position = call compile format ["%1", _position]};
if(_garagePosition isEqualType "") then {_garagePosition = call compile format ["%1", _garagePosition]};
_newGangHouse = [_houseID, _classname, _position, _garagePosition, _battery];
};

if(DEBUG) then {
diag_log format ["DEBUG [33]: %1", _newGangHouse];
};

/** GANG HOUSE UPGRADES **/
_query = format["SELECT upgrade, amount FROM house_upgrades WHERE house_id = '%1'", _houseID];
private _gangHouseUpgradeQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [34]: %1", _gangHouseUpgradeQuery];
};

/** GANG HOUSE CRYPTOCURRENCY **/
_query = format["SELECT name, value FROM gang_houses_crypto WHERE house_id = '%1'", _houseID];
private _gangHouseCryptoQuery = [_query, 2, true] call HC_fnc_asyncCall;

if(DEBUG) then {
diag_log format ["DEBUG [35]: %1", _gangHouseCryptoQuery];
};

/** SCHLÜSSEL **/
_keyArray = missionNamespace getVariable [format["%1_KEYS_%2", _pID, _pSide],[]];

if(DEBUG) then {
diag_log format ["DEBUG [36]: %1", _keyArray];
};

private _ownerName = [_gangInfoQuery, _gangPermissionsQuery, _gangBuffsQuery, _newGangHouse, _gangHouseUpgradeQuery, _gangHouseCryptoQuery] call HC_fnc_initGangHC;
if(DEBUG) then {
diag_log format ["DEBUG [37]: %1", _ownerName];
};
if(_ownerName != "") then {_gangInfoQuery pushBack _ownerName;};
_queryResult = [[_keyArray], _infoQuery, _passportQuery, _levelQuery, _playtimeQuery, _licenseQuery, _skillsQuery, _newHouses, _aliveQuery, _jailQuery, _moneyQuery, _gearQuery, _virtQuery, _lockerQuery, _loadoutQuery, _affiliateQuery, _affiliatePlayersQuery, _gangInfoQuery, _gangPermissionsQuery, _gangBuffsQuery, _newGangHouse, _gangHouseUpgradeQuery, _gangHouseCryptoQuery];

if(DEBUG) then {
diag_log format ["DEBUG [38]: %1", _queryResult];
};

if(_saveIndex >= 0) then {
(SAVE_ARRAY select _saveIndex) set [SAVE_STATE_INDEX, _queryResult];
};

if(DEBUG) then {
diag_log format ["DEBUG [39]: %1", _saveIndex];
};

private _geheimZahl = [_pID, _pSide] call HC_fnc_getGeheimzahl;

if(DEBUG) then {
diag_log format ["DEBUG [40]: %1", _geheimZahl];
};

sleep 1;
[_queryResult, _geheimZahl] remoteExec ["SOCK_fnc_retrieveDatabaseInfo", _remoteObject];