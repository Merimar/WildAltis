private _unit = param [0, objNull, [objNull]];
private _scriptToUse = param [1, ""];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_checkSign"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _msg = format ["Der Spieler %1 (%2 - %3) wurde bei einem LazyEval Hack deteckted (SCRIPT: %4)", name _unit, getPlayerUID _unit, side _unit, str _scriptToUse];
["LazyEval", _msg] call HC_fnc_Log;

[format ["Bei dem Spieler %1 wurde ein LazyEval Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;

//"WAC" callExtension format ["BAN>%1", getPlayerUID _unit];