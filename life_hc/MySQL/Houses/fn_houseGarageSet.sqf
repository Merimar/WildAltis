private _unit = param [0, objNull, [objNull]];
private _house = param [1, objNull, [objNull]];
private _houseType = param [2, false, [false]];
private _spawnPos = param [3, [0, 0, 0], [[]]];
private _spawnDir = param [4, 0, [0]];
_spawnPos pushBack _spawnDir;

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_houseGarageSet"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _house) exitWith {};

private _group = group _unit;
private _groupID = _group getVariable ["gang_id", -1];

if(_houseType) then {
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 0 == _groupID};

if(_gangIndex isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte einen Garagen Spawnpunkt setzen, die Gang existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "GarageSet Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein GarageSet Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

(PLAYER_GANG_ARRAY select _gangIndex select 9) set [3, _spawnPos];
private _query = format ["UPDATE gang_houses SET position_garage = '%1' WHERE gang_id = '%2'", [_spawnPos] call HC_fnc_mresArray, _groupID];
[_query, 1] call HC_fnc_asyncCall;
}else {
_house setVariable ["house_garage", _spawnPos, true];

private _houseID = _group getVariable ["house_id", -1];
private _query = format ["UPDATE player_houses SET garage_position = '%1' WHERE id = '%2'", [_spawnPos] call HC_fnc_mresArray, _houseID];
[_query, 1] call HC_fnc_asyncCall;
};