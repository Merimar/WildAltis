CURRENT_CRIMINAL = param [0, objNull];
CURRENT_CRIMES_TICKET = param [1, []];

if(!(isNull findDisplay 2650)) exitWith {[player, CURRENT_CRIMINAL] remoteExec ["HC_fnc_ticketCancel", HC_LIFE];};
createDialog "TicketGive";

private _display = findDisplay 2650;
private _list = _display displayCtrl 2651;
private _money = _display displayCtrl 2652;
private _perc = _display displayCtrl 2653;
private _btnTicket = _display displayCtrl 2661;

CURRENT_CRIME_MONEY = 0;
CURRENT_CRIME_PERC = 0;
private _force = true;

{
private _crime = _x select 0;
private _amount = _x select 1;
private _name = getText (missionConfigFile >> "CfgWanted" >> _crime >> "name");
private _fine = (getNumber (missionConfigFile >> "CfgWanted" >> _crime >> "charge")) * _amount;
private _xPerc = getNumber (missionConfigFile >> "CfgWanted" >> _crime >> "percentage");
private _xForce = (getNumber (missionConfigFile >> "CfgWanted" >> _crime >> "force")) isEqualTo 1;
CURRENT_CRIME_MONEY = CURRENT_CRIME_MONEY + _fine;
if(_xPerc > CURRENT_CRIME_PERC) then {CURRENT_CRIME_PERC = _xPerc;};
if(_xForce) then {_force = false;};
_list lbAdd format ["%1x %2", _amount, _name];
}forEach CURRENT_CRIMES_TICKET;

_money ctrlSetText ([CURRENT_CRIME_MONEY] call life_fnc_numberText);
_perc ctrlSetText str CURRENT_CRIME_PERC;

if(_force) then {_btnTicket ctrlEnable false;};
TICKET_GIVEN = false;

waitUntil {isNull (findDisplay 2650)};

if(!TICKET_GIVEN) then {[player, CURRENT_CRIMINAL] remoteExec ["HC_fnc_ticketCancel", HC_LIFE];}; 
TICKET_GIVEN = false;