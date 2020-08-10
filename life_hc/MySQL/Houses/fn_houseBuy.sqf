private _unit = param [0, objNull, [objNull]];
private _house = param [1, objNull, [objNull]];
private _buyType = param [2, false, [false]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_houseBuy"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _house) exitWith {};

private _housePosition = getPos _house;
private _garagePosition = [0, 0, 0, 0];
private _houseClassname = typeOf _house;
private _buyPrice = getNumber (missionConfigFile >> "CfgHouses" >> _houseClassname >> "price");
private _houseName = getText (configFile >> "CfgVehicles" >> _houseClassname >> "displayName");
private _pName = name _unit;
private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _geheimZahl = [_pID, _pSide] call HC_fnc_getGeheimzahl;

if(_house getVariable ["Virtus_Object", false]) exitWith {[_geheimZahl, _buyType, 0] remoteExec ["life_fnc_houseRemote", _unit];};

if(_buyType) then {
private _group = group _unit;
private _gangID = _group getVariable ["gang_id", -1];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 0 == _gangID};
if(_gangIndex isEqualTo -1) exitWith {[_geheimZahl, _buyType, 0] remoteExec ["life_fnc_houseRemote", _unit];};
private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _gangName = _gangInformation select 1;
private _gangBank = _gangInformation select 5;

if(_gangBank < _buyPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte sich ein Ganghaus kaufen, seine Gang hat aber nicht genug Geld", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "House Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein House Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
[_geheimZahl, _buyType, 0] remoteExec ["life_fnc_houseRemote", _unit];
};

private _query = format ["SELECT id FROM gang_houses WHERE position = '%1' AND deleted_at IS NULL", [_housePosition] call HC_fnc_mresArray];
private _checkIfHouseExists = [_query, 2] call HC_fnc_asyncCall;

if(count _checkIfHouseExists > 0) exitWith {[_geheimZahl, _buyType, 1] remoteExec ["life_fnc_houseRemote", _unit];};

_query = format ["SELECT id FROM gang_houses WHERE gang_id = '%1' AND deleted_at IS NULL", _gangID];
private _checkQuery = [_query, 2] call HC_fnc_asyncCall;

if(count _checkQuery > 0) exitWith {[_geheimZahl, _buyType, 2] remoteExec ["life_fnc_houseRemote", _unit];};

_query = format ["INSERT INTO gang_houses (gang_id, classname_id, position, position_garage, battery) VALUES ('%1', (SELECT id FROM life_classnames WHERE classname = '%2'), '%3', '%4', '%5')", _gangID, _houseClassname, [_housePosition] call HC_fnc_mresArray, [_garagePosition] call HC_fnc_mresArray, 0];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["UPDATE gangs SET bank_balance = '%1' WHERE uid='%2' AND deleted_at IS NULL", _gangBank - _buyPrice, _gangID];
[_query, 1] call HC_fnc_asyncCall;

sleep 1;

_query = format ["SELECT id FROM gang_houses WHERE gang_id = '%1' AND deleted_at IS NULL", _gangID];
private _houseID = [_query, 2] call HC_fnc_asyncCall;
_houseID = _houseID param [0, -1];

private _houseQuery = [_houseID, _houseClassname, _housePosition, _garagePosition, 0];
private _houseUpgrades = [["markt", 0], ["atm", 0], ["garage", 0], ["generalstore", 0]];

{
_query = format ["INSERT INTO house_upgrades (house_id, upgrade, amount) VALUES ('%1', '%2', '%3')", _houseID, _x select 0, _x select 1];
[_query, 1] call HC_fnc_asyncCall;
}forEach _houseUpgrades;

_gangInformation set [9, _houseQuery];
_gangInformation set [10, _houseUpgrades];
_gangInformation set [5, _gangBank - _buyPrice];
_group setVariable ["gang_bank", _gangBank - _buyPrice, true];
private _houseInfo = [_gangID, _gangName, _pID, _garagePosition];

_house setVariable ["house_bought", true, true];
_house setVariable ["house_id", _houseID, true];
_house setVariable ["house_information", _houseInfo, true];
_house setVariable ["house_upgrades", _houseUpgrades, true];
_house setVariable ["house_garage", _garagePosition, true];

private _doorCount = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_int" from 0 to _doorCount step 1 do {_house setVariable [format ["bis_disabled_Door_%1", _int], 1, true];};

if(!(isNull _unit)) then {
[_geheimZahl, _buyType, 4, format ["Du hast ein %1 für deine Gang gekauft.<br/> Du hast $%2 bezahlt", _houseName, [_buyPrice] call HC_fnc_numberSafe], _buyPrice] remoteExec ["life_fnc_houseRemote", _unit];
[_geheimZahl, _buyType, 9, _house] remoteExec ["life_fnc_houseRemote", _unit];
};
[_houseClassname, _housePosition] remoteExec ["life_fnc_houseMarker", units _group];

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Ganghaus für seine Gang %4 gekauft (ID: %5)", _pName, _pID, _pSide, _gangInformation select 1, _houseID];
["GangLog", _msg] call HC_fnc_Log;

private _houses = bank_obj getVariable ["gang_houses", []];
_houses pushBack _house;
bank_obj setVariable ["gang_houses", _houses, true];
}else {
private _playerBank = [getPlayerUID _unit, side _unit, "bank"] call HC_fnc_getMoney;
if(_playerBank < _buyPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte sich ein Haus kaufen, hat aber nicht genug Geld", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "House Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein House Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
[_geheimZahl, _buyType, 0] remoteExec ["life_fnc_houseRemote", _unit];
};

private _query = format ["SELECT id FROM player_houses WHERE position = '%1' AND deleted_at IS NULL", [_housePosition] call HC_fnc_mresArray];
private _checkIfHouseExists = [_query, 2] call HC_fnc_asyncCall;

if(count _checkIfHouseExists > 0) exitWith {[_geheimZahl, _buyType, 1] remoteExec ["life_fnc_houseRemote", _unit];};

_query = format ["SELECT id FROM player_houses WHERE owner_id = '%1' AND deleted_at IS NULL", getPlayerUID _unit];
private _checkQuery = [_query, 2] call HC_fnc_asyncCall;

if(count _checkQuery > 1) exitWith {[_geheimZahl, _buyType, 3] remoteExec ["life_fnc_houseRemote", _unit];};

_query = format ["INSERT INTO player_houses (owner_id, classname_id, position, garage_position) VALUES ('%1', (SELECT id FROM life_classnames WHERE classname = '%2'), '%3', '%4')", getPlayerUID _unit, _houseClassname, [_housePosition] call HC_fnc_mresArray, [_garagePosition] call HC_fnc_mresArray, 0];
[_query, 1] call HC_fnc_asyncCall;

sleep 1;

_query = format ["SELECT id FROM player_houses WHERE owner_id = '%1' AND deleted_at IS NULL", _pID];
private _houseID = [_query, 2] call HC_fnc_asyncCall;
_houseID = _houseID param [0, -1];

private _houseUpgrades = [["markt", 0], ["atm", 0], ["garage", 0], ["generalstore", 0]];
private _houseInfo = [-2, "", _pID, _garagePosition];

private _doorCount = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_int" from 0 to _doorCount step 1 do {_house setVariable [format ["bis_disabled_Door_%1", _int], 1, true];};

_house setVariable ["house_bought", true, true];
_house setVariable ["house_id", _houseID, true];
_house setVariable ["house_information", _houseInfo, true];
_house setVariable ["house_upgrades", _houseUpgrades, true];
_house setVariable ["house_garage", _garagePosition, true];

if(!(isNull _unit)) then {
[_geheimZahl, _buyType, 5, format ["Du hast ein %1 gekauft.<br/> Du hast $%2 bezahlt", _houseName, [_buyPrice] call HC_fnc_numberSafe], _buyPrice] remoteExec ["life_fnc_houseRemote", _unit];
[_geheimZahl, _buyType, 9, _house] remoteExec ["life_fnc_houseRemote", _unit];
[_houseClassname, _housePosition] remoteExec ["life_fnc_houseMarker", _unit];
};

[_pID, _pSide, "bank", _buyPrice, false] call HC_fnc_handleMoney;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Haus gekauft (ID: %4)", _pName, _pID, _pSide, _houseID];
["HouseLog", _msg] call HC_fnc_Log;

private _houses = bank_obj getVariable ["gang_houses", []];
_houses pushBack _house;
bank_obj setVariable ["gang_houses", _houses, true];
};