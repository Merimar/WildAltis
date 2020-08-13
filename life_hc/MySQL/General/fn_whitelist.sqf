private _unit = param [0, objNull, [objNull]];
private _whitelistPlayer = param [1, objNull, [objNull]];
private _level = param [2, 0, [0]];
private _side = param [3, "", ["", sideUnknown]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_whitelist"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _what = switch (_side) do {case west : {"cop"}; case independent : {"medic"};};
private _query = format["UPDATE player_level SET level = '%1' WHERE player_id = '%2' AND level_id = (SELECT id FROM life_levels WHERE name = '%3')", _level, getPlayerUID _unit, _what];
[_query,1] call HC_fnc_asyncCall;

[getPlayerUID _whitelistPlayer, _what, _level] call HC_fnc_setSpecialLevel;
private _geheimZahl = [getPlayerUID _whitelistPlayer] call HC_fnc_getGeheimzahl;

private _msg = format["Der Spieler %1 (%2 - %3) wurde von %4 (%5 - %6) auf %7level: %8 gewhitelistet!", name _whitelistPlayer, getPlayerUID _whitelistPlayer, side _whitelistPlayer, name _unit, getPlayerUID _unit, side _unit, _what, _level];
["WhitelistLog", _msg] call HC_fnc_Log;
["Whitelist", _geheimZahl] remoteExecCall ["life_fnc_endMission", _whitelistPlayer];