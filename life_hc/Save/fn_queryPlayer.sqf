#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];

if(isNull _unit) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;

private _sideID = [_pSide] call HC_fnc_getSideID;
private _groupSideID = [_pSide] call HC_fnc_getGroupSideID;

/** BASIC INFORMATION **/
private _query = format["SELECT id, steam_id, created_at FROM players WHERE steam_id = '%1'", _pID];
private _infoQuery = [_query, 2] call HC_fnc_asyncCall;

if(_infoQuery isEqualType "") exitWith {[_unit] spawn HC_fnc_insertPlayerToDatabase;};
if(count _infoQuery isEqualTo 0) exitWith {[_unit] spawn HC_fnc_insertPlayerToDatabase;};

/** PASSPORT **/
_query = format["SELECT name, first_name, last_name, postal_code, street, country, province, city, house_number FROM player_names WHERE player_id = '%1' AND side_id = '%2' AND deleted_at IS NULL", _pID, _sideID];
private _passportQuery = [_query, 2] call HC_fnc_asyncCall;

if(_passportQuery isEqualType "") exitWith {sleep 3;[] remoteExec ["SOCK_fnc_firstJoin", _unit];CURRENT_AUSWEIS_CREATE pushBack _pID;};
if(count _passportQuery isEqualTo 0) exitWith {sleep 3;[] remoteExec ["SOCK_fnc_firstJoin", _unit];CURRENT_AUSWEIS_CREATE pushBack _pID;};

/** LEVELS **/
_query = format["SELECT life_levels.name, player_level.level FROM player_level LEFT JOIN life_levels ON player_level.level_id = life_levels.id WHERE player_level.player_id = '%1'", _pID];
private _levelQuery = [_query, 2, true] call HC_fnc_asyncCall;

/** PLAYTIME **/
_query = format["SELECT time FROM player_playtimes WHERE player_id = '%1'", _pID];
private _playtimeQuery = [_query, 2, true] call HC_fnc_asyncCall;
_playtimeQuery = [_playtimeQuery, 0] call HC_fnc_multiArrayToArray;

/** LICENSES **/
_query = format["SELECT life_licenses.license FROM player_licenses LEFT JOIN life_licenses ON player_licenses.license_id = life_licenses.id WHERE player_licenses.player_id = '%1'", _pID];
private _licenseQuery = [_query, 2, true] call HC_fnc_asyncCall;
_licenseQuery = [_licenseQuery, 0] call HC_fnc_multiArrayToArray;

/** SKILLS **/
_query = format["SELECT life_skills.skill, player_skills.xp FROM player_skills LEFT JOIN life_skills ON player_skills.skill_id = life_skills.id WHERE player_skills.player_id = '%1'", _pID];
private _skillsQuery = [_query, 2, true] call HC_fnc_asyncCall;

/** PLAYER HOUSES **/
_query = format["SELECT player_houses.id, life_classnames.classname, player_houses.position, player_houses.garage_position  FROM player_houses LEFT JOIN life_classnames ON player_houses.classname_id = life_classnames.id WHERE player_houses.owner_id = '%1' AND player_houses.deleted_at IS NULL", _pID];
private _houseQuery = [_query, 2, true] call HC_fnc_asyncCall;

private _newHouses = [];
{
private _houseID = _x select 0;
private _classname = _x select 1;
private _position = [_x select 2] call HC_fnc_mresToArray;
private _garagePosition = [_x select 3] call HC_fnc_mresToArray;
_newHouses pushBack [_houseID, _classname, _position, _garagePosition];
}forEach _houseQuery;

/** ALIVE **/
_query = format["SELECT status FROM player_alive WHERE player_id = '%1' AND side_id = '%2'", _pID, _sideID];
private _aliveQuery = [_query, 2] call HC_fnc_asyncCall;
_aliveQuery = if((_aliveQuery param [0, 1]) isEqualTo 0) then {[false]} else {[true]};

/** JAIL **/
_query = format["SELECT duration FROM player_jail WHERE prisoner_id = '%1' AND side_id = '%2' AND deleted_at IS NULL", _pID, _sideID];
private _jailQuery = [_query, 2] call HC_fnc_asyncCall;
if(count _jailQuery isEqualTo 0) then {_jailQuery = [0]};

/** MONEY **/
_query = format["SELECT player_money.type, player_money.amount FROM player_money WHERE player_money.player_id = '%1' AND player_money.side_id = '%2'", _pID, _groupSideID];
private _moneyQuery = [_query, 2, true] call HC_fnc_asyncCall;

/** GEAR **/
_query = format["SELECT gear FROM player_gear WHERE player_id = '%1' AND side_id = '%2'", _pID, _sideID];
private _gearQuery = [_query, 2] call HC_fnc_asyncCall;
_gearQuery = [_gearQuery select 0] call HC_fnc_mresToArray;

/** VIRT GEAR **/
_query = format["SELECT life_virtual_items.name, player_virtual_items.amount FROM player_virtual_items LEFT JOIN life_virtual_items ON player_virtual_items.item_id = life_virtual_items.id WHERE player_virtual_items.player_id = '%1' AND player_virtual_items.side_id = '%2'", _pID, _sideID];
private _virtQuery = [_query, 2, true] call HC_fnc_asyncCall;

/** LOCKER **/
_query = format["SELECT life_classnames.classname, player_locker.amount FROM player_locker LEFT JOIN life_classnames ON player_locker.classname_id = life_classnames.id WHERE player_locker.player_id = '%1' AND player_locker.side_id = '%2'", _pID, _sideID];
private _lockerQuery = [_query, 2, true] call HC_fnc_asyncCall;

/** LOADOUT **/
_query = format["SELECT loadout FROM player_loadouts WHERE player_id = '%1' AND side_id = '%2'", _pID, _sideID];
private _loadoutQuery = [_query, 2] call HC_fnc_asyncCall;
_loadoutQuery = [_loadoutQuery select 0] call HC_fnc_mresToArray;

/** AFFILIATE **/
_query = format["SELECT code FROM player_affiliate_codes WHERE player_id = '%1'", _pID];
private _affiliateQuery = [_query, 2] call HC_fnc_asyncCall;

/** AFFILIATE PLAYERS **/
_query = format["SELECT player_names.name, player_affiliate_referrals.referrer_id FROM player_affiliate_referrals LEFT JOIN player_names ON player_names.player_id = player_affiliate_referrals.referrer_id WHERE player_affiliate_referrals.owner_id = '%1' AND player_names.side_id = '3'", _pID];
private _affiliatePlayersQuery = [_query, 2, true] call HC_fnc_asyncCall;

/** REWARDS **/
//private _rewardQuery = [_pID] call HC_fnc_rewardQuery;
_rewardQuery = [[], 0];

/** GANG **/
_query = format["SELECT gangs.name, gangs.owner_id, gangs.max_members, gangs.bank_balance, gangs.uid FROM player_gang LEFT JOIN gangs ON player_gang.gang_id = gangs.uid WHERE player_gang.player_id = '%1' AND player_gang.side_id = '%2' AND gangs.deleted_at IS NULL", _pID, _sideID];
private _gangInfoQuery = [_query, 2] call HC_fnc_asyncCall;
private _gangID = if(_gangInfoQuery isEqualType "" || {count _gangInfoQuery isEqualTo 0}) then {-1} else {_gangInfoQuery select 4};

private _gangPermissionsQuery = [];
private _gangBuffsQuery = [];
private _gangHouseQuery = [];
private _newGangHouse = [];
private _gangHouseUpgradeQuery = [];

if(_gangID != -1) then {
/** GANG PERMISSIONS **/
_query = format["SELECT player_gang.player_id, player_gang.side_id, player_gang.level FROM player_gang WHERE player_gang.gang_id = '%1'", _gangID];
_gangPermissionsQuery = [_query, 2, true] call HC_fnc_asyncCall;

/** GANG BUFFS **/
_query = format["SELECT life_buffs.buff, gang_buffs.amount FROM gang_buffs LEFT JOIN life_buffs ON gang_buffs.buff_id = life_buffs.id WHERE gang_buffs.gang_id = '%1'", _gangID];
_gangBuffsQuery = [_query, 2, true] call HC_fnc_asyncCall;

/** GANG HOUSE **/
_query = format["SELECT gang_houses.id, life_classnames.classname, gang_houses.position, gang_houses.position_garage, gang_houses.battery FROM gang_houses LEFT JOIN life_classnames ON gang_houses.classname_id = life_classnames.id WHERE gang_houses.gang_id = '%1' AND gang_houses.deleted_at IS NULL", _gangID];
_gangHouseQuery = [_query, 2] call HC_fnc_asyncCall;

if(_gangHouseQuery isEqualType "" || {count _gangHouseQuery isEqualTo 0}) exitWith {};

private _houseID = _gangHouseQuery select 0;
private _classname = _gangHouseQuery select 1;
private _position = [_gangHouseQuery select 2] call HC_fnc_mresToArray;
private _garagePosition = [_gangHouseQuery select 3] call HC_fnc_mresToArray;
private _battery = _gangHouseQuery select 4;
_newGangHouse = [_houseID, _classname, _position, _garagePosition, _battery];

/** GANG HOUSE UPGRADES **/
_query = format["SELECT upgrade, amount FROM house_upgrades WHERE house_id = '%1'", _houseID];
_gangHouseUpgradeQuery = [_query, 2, true] call HC_fnc_asyncCall;
};

private _ownerName = [_gangInfoQuery, _gangPermissionsQuery, _gangBuffsQuery, _newGangHouse, _gangHouseUpgradeQuery, []] call HC_fnc_initGangHC;
_gangInfoQuery pushBack _ownerName;

/** SCHLÜSSEL **/
private _keyArray = missionNamespace getVariable [format ["%1_KEYS_%2", _pID, _pSide], []];
private _queryResult = [[_keyArray], _infoQuery, _passportQuery, _levelQuery, _playtimeQuery, _licenseQuery, _skillsQuery, _newHouses, _aliveQuery, _jailQuery, _moneyQuery, _gearQuery, _virtQuery, _lockerQuery, _loadoutQuery, _affiliateQuery, _affiliatePlayersQuery, _gangInfoQuery, _gangPermissionsQuery, _gangBuffsQuery, _newGangHouse, _gangHouseUpgradeQuery, [], _rewardQuery];

private _saveState = [_pID] call HC_fnc_getSave;
private _geheimZahl = [_pID] call HC_fnc_getGeheimzahl;
_saveState set [SAVE_STATE_INDEX, _queryResult];

sleep 1;

[_queryResult, _geheimZahl] remoteExec ["SOCK_fnc_retrieveDatabaseInfo", _unit];