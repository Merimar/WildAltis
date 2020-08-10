private _unit = param [0, objNull];
private _type = param [1, "Geld"];
private _amount = param [2, 0];
private _crimes = param [3, []];
private _force = param [4, false];

if(isNull _unit || !(isNull findDisplay 2600)) exitWith {[_unit, player] remoteExec ["HC_fnc_ticketCancel", HC_LIFE];};
createDialog "TicketPay";

private _display = findDisplay 2600;
private _list = _display displayCtrl 2601;
private _info = _display displayCtrl 2602;
private _payBtn = _display displayCtrl 2603;
private _refuseBtn = _display displayCtrl 2604;

{
private _crime = _x select 0;
private _amount = _x select 1;
private _name = getText (missionConfigFile >> "CfgWanted" >> _crime >> "name");
_list lbAdd format ["1x %2", _amount, _name];
}forEach _crimes;

private _ticketName = if(_force) then {"Zwangsticket"} else {"Ticket"};
private _ticketDesc = if(_force) then {"Du hast bezahlt:"} else {"Du musst bezahlen:"};
private _message = format ["%1 hat dir ein %2 gegeben!<br/>%3:<br/>%4", name _unit, _ticketName, _ticketDesc, [_amount] call life_fnc_numberText];

_info ctrlSetStructuredText parseText _message;

if(_force) exitWith {_payBtn ctrlEnable false;_refuseBtn ctrlEnable false;BANK = BANK - _amount;};
if(BANK < _amount) then {_payBtn ctrlEnable false;};

["Du hast 30 Sekunden Zeit das Ticket zu bezahlen! Nach 30 Sekunden wird das Ticket automatisch verwehrt.", "Ticket bezahlen"] spawn life_fnc_message;

TICKET_TIMER_NOT = false;

_display spawn {
private _time = time + 30;
waitUntil {
[[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString, "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
(_time <= time || TICKET_TIMER_NOT)
};
if(!(isNull _this)) then {closeDialog 0;};
["Zeit vorbei", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
};

TICKET_PAYED = false;

waitUntil {isNull (findDisplay 2600)};

TICKET_TIMER_NOT = true;

if(TICKET_PAYED) then {
[_unit, player, _amount] remoteExec ["HC_fnc_ticketPay", HC_LIFE];
BANK = BANK - _amount;
}else {
[_unit, player, _amount] remoteExec ["HC_fnc_ticketRefuse", HC_LIFE];
};