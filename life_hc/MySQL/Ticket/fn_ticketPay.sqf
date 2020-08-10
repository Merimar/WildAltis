private _unit = param [0, objNull, [objNull]];
private _criminal = param [1, objNull, [objNull]];
private _amount = param [2, 0, [0]];

private _isHacker = [[], _criminal, remoteExecutedOwner, "fn_ticketPay"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};
if(isNull _criminal) exitWith {[_unit, _criminal] call HC_fnc_ticketCancel;};

if(!(_criminal in CURRENT_TICKET_LIST)) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Ticket des Spielers %4 (%5 - %6) bezahlen, das Ticket existiert allerdings nicht", name _criminal, getPlayerUID _criminal, side _criminal, name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _criminal];
[_criminal, "Ticket Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Ticket Hack festgestellt", name _criminal], false] call HC_fnc_adminMessage;
};

if((side _unit) != west) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Ticket des Spielers %4 (%5 - %6) bezahlen, der Spieler ist aber kein Cop", name _criminal, getPlayerUID _criminal, side _criminal, name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _criminal];
[_criminal, "Ticket Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Ticket Hack festgestellt", name _criminal], false] call HC_fnc_adminMessage;
};

private _money = [getPlayerUID _criminal, side _criminal, "bank"] call HC_fnc_getMoney;

if(_money < _amount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Ticket des Spielers %4 (%5 - %6) bezahlen, hat aber nicht genug Geld (%7 < %8)", name _criminal, getPlayerUID _criminal, side _criminal, name _unit, getPlayerUID _unit, side _unit, [_money] call HC_fnc_numberSafe, [_amount] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _criminal];
[_criminal, "Ticket Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Ticket Hack festgestellt", name _criminal], false] call HC_fnc_adminMessage;
};

_criminal setVariable ["Bank_geschafft", false, true];

CURRENT_TICKET_LIST = CURRENT_TICKET_LIST - [_criminal];
CURRENT_TICKET_PLAYER = _criminal;
[getPlayerUID _criminal, side _criminal, "bank", _amount, false] call HC_fnc_handleMoney;
[getPlayerUID _unit, side _unit, "bank", _amount, true] call HC_fnc_handleMoney;
[_criminal, "", false, true] call HC_fnc_fahndungHandle;
[0, format ["Der Spieler %1 hat ein Ticket im Wert von €%2 bezahlt", name _criminal, [_amount] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast", -2];
private _geheimZahl = [getPlayerUID _unit, side _unit] call HC_fnc_getGeheimzahl;
[_unit, _amount, _unit, true, true, _geheimZahl] remoteExec ["life_fnc_receiveMoney", _unit];

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Ticket des Spielers %4 (%5 - %6) im Wert von %7 bezahlt", name _criminal, getPlayerUID _criminal, side _criminal, name _unit, getPlayerUID _unit, side _unit, [_amount] call HC_fnc_numberSafe];
["TicketLog", _msg] call HC_fnc_Log;