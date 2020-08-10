private _unit = param [0, objNull, [objNull]];
private _criminal = param [1, objNull, [objNull]];
private _crimes = param [2, [], [[]]];
private _ticket = param [3, ["Geld", 0], [[]]];
private _force = param [4, false, [false]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_ticketGive"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};
if(isNull _criminal) exitWith {[_unit, _criminal] call HC_fnc_ticketCancel;};

if(side _unit != west) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) ein Ticket geben, ist aber kein Cop", name _unit, getPlayerUID _unit, side _unit, name _criminal, getPlayerUID _criminal, side _criminal];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Ticket Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Ticket Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _ticketName = if(_force) then {"Zwangsticket"} else {"Ticket"};
private _type = _ticket select 0;
private _amount = _ticket select 1;

if((_type == "Geld" && _amount > 10000000) || (_type == "Prozent" && _amount > 5)) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte dem Spieler %4 (%5 - %6) ein Ticket geben, hat aber das Limit überschritten", name _unit, getPlayerUID _unit, side _unit, name _criminal, getPlayerUID _criminal, side _criminal];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Ticket Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Ticket Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _money = [getPlayerUID _criminal, side _criminal, "bank"] call HC_fnc_getMoney;
if(_type == "Prozent") then {_amount = floor (_money * (_amount / 100));};
if(_force && _amount > _money) then {_amount = _money;};

[_unit, _type, _amount, _crimes, _force] remoteExec ["life_fnc_ticketReceive", _criminal];

if(_force) then {
[getPlayerUID _criminal, side _criminal, "bank", _amount, false] call HC_fnc_handleMoney;
CURRENT_TICKET_LIST = CURRENT_TICKET_LIST - [_criminal];
[_criminal, "", false, true] call HC_fnc_fahndungHandle;
[0, format ["Der Spieler %1 hat ein Ticket im Wert von %2 bezahlt", name _criminal, [_amount] call HC_fnc_numberSafe]] remoteExec ["life_fnc_broadcast", -2];
};

private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) ein %7 gegeben (TYPE: %8 WERT: %9)", name _unit, getPlayerUID _unit, side _unit, name _criminal, getPlayerUID _criminal, side _criminal, _ticketName, _type, [_amount] call HC_fnc_numberSafe];
["TicketLog", _msg] call HC_fnc_Log;