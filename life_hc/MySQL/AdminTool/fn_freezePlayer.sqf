private _unit = param [0, objNull, [objNull]];
private _freezePlayer = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_freezePlayer", true] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _freezePlayer) exitWith {};

private _geheimZahl = [getPlayerUID _freezePlayer, side _freezePlayer] call HC_fnc_getGeheimzahl;
[_unit, _geheimZahl] remoteExec ["life_fnc_freezePlayer",_freezePlayer];

private _msg = format ["Der Spieler %1 (%2 - %3) hat %4 (%5 - %6) eingefroren", name _unit, getPlayerUID _unit, side _unit, name _freezePlayer, getPlayerUID _freezePlayer, side _freezePlayer];
["AdminLog", _msg] call HC_fnc_Log;