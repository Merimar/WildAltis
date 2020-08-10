private _unit = param [0, objNull, [objNull]];
private _criminal = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_ticketPlayer"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _criminal) exitWith {};
if(_criminal in CURRENT_TICKET_LIST) exitWith {["Es stellt bereits ein Spieler ein Ticket aus.", "Ticket geben"] remoteExec ["life_fnc_message", _unit];};

CURRENT_TICKET_LIST pushBack _criminal;
[_unit, _criminal] spawn {
waitUntil {isNull (_this select 0) || CURRENT_TICKET_PLAYER isEqualTo (_this select 1)};
if(CURRENT_TICKET_PLAYER isEqualTo (_this select 1)) exitWith {CURRENT_TICKET_PLAYER = objNull;};
CURRENT_TICKET_LIST = CURRENT_TICKET_LIST - [_criminal];
};

private _crimeIndex = CRIME_LIST findIf {_x select 1 == getPlayerUID _criminal};
private _straftaten = if(_crimeIndex != -1) then {CRIME_LIST select _crimeIndex select 6;} else {[]};

[_criminal, _straftaten] remoteExec ["life_fnc_ticketGetPlayer", _unit];