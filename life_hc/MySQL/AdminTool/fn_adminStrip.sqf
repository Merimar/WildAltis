private _unit = param [0, objNull, [objNull]];
private _stripPlayer = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_adminStrip", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _geheimZahl = [getPlayerUID _stripPlayer, side _stripPlayer] call HC_fnc_getGeheimzahl;
[_geheimZahl] remoteExec ["life_fnc_remoteStrip", _stripPlayer];

[getPlayerUID _stripPlayer, side _stripPlayer, []] call HC_fnc_handleInv;

private _msg = format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) gestripped", name _unit, getPlayerUID _unit, side _unit, name _stripPlayer, getPlayerUID _stripPlayer, side _stripPlayer];
["AdminLog", _msg] call HC_fnc_Log;