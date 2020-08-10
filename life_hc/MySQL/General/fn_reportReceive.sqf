private _unit = param [0, objNull, [objNull]];
private _eingabe = param [1, "", [""]];

private _isHacker = [[_eingabe], _unit, remoteExecutedOwner, "fn_reportReceive"] call HC_fnc_checkSQLBreak;
if(_isHacker || _eingabe == "") exitWith {};

private _query = format ["INSERT INTO bugreport (player_id, position, message) VALUES ('%1', '%2', '%3')", getPlayerUID _unit, getPos _unit, _eingabe];
[_query,1] call HC_fnc_asyncCall;

private _msg = format ["Der Spieler %1 (%2 - %3) hat einen Bugreport abgeschickt (NACHRICHT: %4)", name _unit, getPlayerUID _unit, side _unit, _eingabe];
["ReportLog", _msg] call HC_fnc_Log;