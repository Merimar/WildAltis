private _unit = param [0, objNull, [objNull]];
private _house = param [1, objNull, [objNull]];
private _buyType = param [2, false, [false]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_houseSell"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _house) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _geheimZahl = [_pID] call HC_fnc_getGeheimzahl;
private _housePositionReal = getPos _house;
private _houseClassnameReal = typeOf _house;
private _houseName = getText (configFile >> "CfgVehicles" >> _houseClassnameReal >> "displayName");

if(_buyType) then {
private _group = group _unit;
private _gangID = _group getVariable ["gang_id", -1];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 0 == _gangID};
if(_gangIndex isEqualTo -1) exitWith {[_geheimZahl, _buyType, 0] remoteExec ["life_fnc_houseRemote", _unit];};
private _gangInformation = PLAYER_GANG_ARRAY select _gangIndex;
private _ownerID = _gangInformation select 2;
private _houseClassname = _gangInformation select 9 param [1, ""];
if(_ownerID != _pID || _houseClassname == "") exitWith {[_geheimZahl, _buyType, 6] remoteExec ["life_fnc_houseRemote", _unit];};

private _query = format ["SELECT id FROM gang_houses WHERE position = '%1' AND gang_id = '%2' AND deleted_at IS NULL", [_housePositionReal] call HC_fnc_mresArray, _gangID];
private _checkIfHouseExists = [_query, 2] call HC_fnc_asyncCall;

if(count _checkIfHouseExists isEqualTo 0) exitWith {[_geheimZahl, _buyType, 0] remoteExec ["life_fnc_houseRemote", _unit];};
private _houseID = _checkIfHouseExists select 0;

_query = format ["UPDATE gang_houses SET deleted_at = now() WHERE id = '%1'", _houseID];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["DELETE FROM gang_houses_crypto WHERE house_id = '%1'", _houseID];
[_query, 1] call HC_fnc_asyncCall;

_query = format ["DELETE FROM house_upgrades WHERE house_id = '%1'", _houseID];
[_query, 1] call HC_fnc_asyncCall;

_gangInformation set [9, []];
_gangInformation set [10, []];
_gangInformation set [11, []];

_house setVariable ["house_bought", false, true];
_house setVariable ["house_id", nil, true];
_house setVariable ["house_information", nil, true];
_house setVariable ["house_upgrades", nil, true];
_house setVariable ["house_garage", nil, true];

private _houses = bank_obj getVariable ["gang_houses", []];
_houses = _houses - [_house];
bank_obj setVariable ["gang_houses", _houses, true];

[_houseClassnameReal, _housePositionReal, true] remoteExec ["life_fnc_houseMarker", units _group];
[_geheimZahl, _buyType, 7] remoteExec ["life_fnc_houseRemote", _unit];

private _msg = format ["Der Spieler %1 (%2 - %3) hat das Ganghaus der Gang %4 verkauft (ID: %5)", name _unit, _pID, _pSide, _gangInformation select 1, _houseID];
["GangLog", _msg] call HC_fnc_Log;
}else {
private _query = format ["SELECT id FROM player_houses WHERE position = '%1' AND owner_id = '%2' AND deleted_at IS NULL", [_housePositionReal] call HC_fnc_mresArray, _pID];
private _checkIfHouseExists = [_query, 2] call HC_fnc_asyncCall;

if(count _checkIfHouseExists isEqualTo 0) exitWith {[_geheimZahl, _buyType, 0] remoteExec ["life_fnc_houseRemote", _unit];};
private _houseID = _checkIfHouseExists select 0;

_query = format ["UPDATE player_houses SET deleted_at = now() WHERE id = '%1'", _houseID];
[_query, 1] call HC_fnc_asyncCall;

_house setVariable ["house_bought", false, true];
_house setVariable ["house_id", nil, true];
_house setVariable ["house_information", nil, true];
_house setVariable ["house_upgrades", nil, true];
_house setVariable ["house_garage", nil, true];

private _houses = bank_obj getVariable ["gang_houses", []];
_houses = _houses - [_house];
bank_obj setVariable ["gang_houses", _houses, true];

[_houseClassnameReal, _housePositionReal, true] remoteExec ["life_fnc_houseMarker", _unit];
[_geheimZahl, _buyType, 8] remoteExec ["life_fnc_houseRemote", _unit];
private _msg = format ["Der Spieler %1 (%2 - %3) hat sein Haus verkauft (ID: %4)", name _unit, _pID, _pSide, _houseID];
["HouseLog", _msg] call HC_fnc_Log;
};