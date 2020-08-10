#include "..\script_macros.hpp"
if(!isNil "life_session_completed") exitWith {};
private _saveStatus = param [0, []];
life_geheimZahl = param [1, -1];
[] call compile PreprocessFileLineNumbers "Functions\configuration.sqf";

private _sessionInfo = _saveStatus select 0;
private _playerInfo = _saveStatus select 1;
private _passportInfo = _saveStatus select 2;
private _levelInfo = _saveStatus select 3;
private _playtimeInfo = _saveStatus select 4;
private _licenseInfo = _saveStatus select 5;
private _skillInfo = _saveStatus select 6;
private _housesInfo = _saveStatus select 7;
private _aliveInfo = _saveStatus select 8;
private _jailInfo = _saveStatus select 9;
private _moneyInfo = _saveStatus select 10;
private _gearInfo = _saveStatus select 11;
private _virtInfo = _saveStatus select 12;
private _lockerInfo = _saveStatus select 13;
private _loadoutInfo = _saveStatus select 14;
private _affiliateInfo = _saveStatus select 15;
private _affiliatePlayerInfo = _saveStatus select 16;
private _gangInfo = _saveStatus select 17;
private _gangPermissionInfo = _saveStatus select 18;
private _gangBuffInfo = _saveStatus select 19;
private _gangHouse = _saveStatus select 20;
private _gangUpgradeInfo = _saveStatus select 21;
private _gangCryptoInfo = _saveStatus select 22;

/** PLAYER **/
life_uid = _playerInfo select 0;
life_pid = _playerInfo select 1;
life_first_join_date = _playerInfo select 2;

/** AUSWEIS **/
AUSWEIS = _passportInfo;
PLAYER_NAME = _passportInfo select 0;

private _adminLevel = _levelInfo select (_levelInfo findIf {_x select 0 == "admin"}) select 1;
private _medicLevel = _levelInfo select (_levelInfo findIf {_x select 0 == "medic"}) select 1;
private _copLevel = _levelInfo select (_levelInfo findIf {_x select 0 == "cop"}) select 1;
private _donoLevel = _levelInfo select (_levelInfo findIf {_x select 0 == "dono"}) select 1;

if(_copLevel isEqualTo 0 && _adminLevel > 1) then {_copLevel = 1;};
if(_medicLevel isEqualTo 0 && _adminLevel > 1) then {_medicLevel = 1;};

/** LEVEL **/
CONST(life_adminlevel, _adminLevel);
CONST(life_medicLevel, _medicLevel);
CONST(life_coplevel, _copLevel);
CONST(life_donorlevel, _donoLevel);

/** PLAYTIME **/
life_playtime = (_playtimeInfo select 0) + (_playtimeInfo select 1) + (_playtimeInfo select 2) + (_playtimeInfo select 3);

/** LIZENZEN **/
LICENSES = _licenseInfo;

/** SKILLS **/
SKILL_SYSTEM = _skillInfo;

/** ALIVE **/
life_isDead = !(_aliveInfo select 0);

/** JAIL **/
JAIL_TIME = _jailInfo select 0;

/** MONEY **/
BANK = [_moneyInfo, "bank"] call life_fnc_getMoneyValue;
CASH = [_moneyInfo, "cash"] call life_fnc_getMoneyValue;

/** VIRT **/
life_virt_gear = [];
life_maxWeight = 1000;
_virtInfo = _virtInfo select {(_x select 1) > 0};
{[true, _x select 0, _x select 1] call life_fnc_handleInv;}forEach _virtInfo;

/** LOCKER **/
LOCKER = _lockerInfo;

/** LOADOUTS **/
life_allLoadouts = _loadoutInfo;

/** AFFILIATE **/
life_code = _affiliateInfo param [0, ""];
life_code_players = _affiliatePlayerInfo;

/** GANG **/
life_gangData = [_gangInfo, _gangPermissionInfo, _gangBuffInfo, _gangHouse, _gangUpgradeInfo, _gangCryptoInfo];

/** SESSION **/
_keys = _sessionInfo select 0;

life_houses = [];
PLAYER_HOUSE_COUNT = count _housesInfo;
/** HOUSES **/
if(playerSide in [civilian, east]) then {
{
if(count _x > 0) then {
private _classname = _x select 1;
private _position = _x select 2;
private _house = nearestObject [_position, _classname];
if(!(isNull _house)) then {
if((getPos _house) distance _position < 1) then {
life_houses pushBack _house;
[_classname, _position] call life_fnc_houseMarker;
};
};
};
}forEach _housesInfo + [_gangHouse];
};

if(!(profileName isEqualTo PLAYER_NAME)) exitWith {
[format["Du hast dich mit einem falschen Namen angemeldet, dein richtiger Name lautet: %1", PLAYER_NAME], "Falscher Name"] spawn life_fnc_message;
sleep 7;
["WrongName",true,false] spawn BIS_fnc_endMission;
};

if(playerSide isEqualTo east && !("rebel" in LICENSES)) exitWith {
["", "Du brauchst eine Rebellenlizenz um diesen Slot benutzen zu können"] spawn life_fnc_message;
sleep 7;
["NotRebel",true,false] spawn BIS_fnc_endMission;
};

private _gear = if(life_isDead) then {[]} else {_gearInfo};
[_gear] call life_fnc_loadGear;
[] call life_fnc_initGang;

{life_vehicles pushBack _x;}forEach _keys;
life_session_completed = true;