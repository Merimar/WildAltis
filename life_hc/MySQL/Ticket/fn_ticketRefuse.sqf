private _unit = param [0, objNull, [objNull]];
private _criminal = param [1, objNull, [objNull]];
private _amount = param [2, 0, [0]];

private _isHacker = [[], _criminal, remoteExecutedOwner, "fn_ticketRefuse"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};
if(isNull _criminal) exitWith {[_unit, _criminal] call HC_fnc_ticketCancel;};

if(!(_criminal in CURRENT_TICKET_LIST)) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Ticket des Spielers %4 (%5 - %6) verwehren, das Ticket existiert allerdings nicht", name _unit, getPlayerUID _unit, side _unit, name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Ticket Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Ticket Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if((side _unit) != west) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Ticket des Spielers %4 (%5 - %6) verwehren, der Spieler ist aber kein Cop", name _unit, getPlayerUID _unit, side _unit, name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Ticket Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Ticket Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

CURRENT_TICKET_LIST = CURRENT_TICKET_LIST - [_criminal];
CURRENT_TICKET_PLAYER = _criminal;

[format ["Der Spieler %1 hat dein Ticket nicht bezahlt", name _criminal], "Ticket verwehrt"] remoteExec ["life_fnc_message", _unit];

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Ticket des Spielers %4 (%5 - %6) im Wert von %7 verwehrt", name _criminal, getPlayerUID _criminal, side _criminal, name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe];
["TicketLog", _msg] call HC_fnc_Log;