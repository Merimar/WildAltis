private _unit = param [0, objNull, [objNull]];
private _information = param [1, [], [[]]];
private _pID = _information param [0, ""];
private _pName = _information param [1, ""];

private _isHacker = [[_pID, _pName], _unit, remoteExecutedOwner, "fn_bluforSavezone"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

[format ["Bei dem Spieler %1 wurde ein Zweitaccount festgestellt (NAME: %2 UID: %3)", name _unit, _pName, _pID], false] call HC_fnc_adminMessage;

private _msg = format ["Bei dem Spieler %1 (%2 - %3) wurde ein Zweitaccount festgestellt (NAME: %4 UID: %5)", name _unit, getPlayerUID _unit, side _unit, _pName, _pID];
["DoubleAccountLog", _msg] call HC_fnc_Log;