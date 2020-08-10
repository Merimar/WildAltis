private _markerX = param [0, "", [""]];
private _markerY = param [1, "", [""]];
private _unit = param [2, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_sperrzone"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _msg = format ["Der Spieler %1 (%2 - %3) hat eine Sperrzone an der Position %4 erstellt", name _unit, getPlayerUID _unit, side _unit, markerPos _markerX];
["SperrzonenLog", _msg] call HC_fnc_Log;

sleep 300;

deleteMarker _markerX;
deleteMarker _markerY;