disableSerialization;
private _force = param [0, false];
private _display = findDisplay 2650;
private _editMoney = parseNumber (ctrlText 2654);
private _editPerc = parseNumber (ctrlText 2655);

private _checkedPerc1 = cbChecked (_display displayCtrl 2656);
private _checkedPerc2 = cbChecked (_display displayCtrl 2657);
private _checkedMoney1 = cbChecked (_display displayCtrl 2658);
private _checkedMoney2 = cbChecked (_display displayCtrl 2659);

private _count = 0;
{if(_x) then {_count = _count + 1;};}forEach [_checkedPerc1, _checkedPerc2, _checkedMoney1, _checkedMoney2];
if(_count != 1) exitWith {["Du kannst nur eine Auswahl treffen.", "Ticket geben"] spawn life_fnc_message;};
if(isNull CURRENT_CRIMINAL) exitWith {};
if(TICKET_GIVEN) exitWith {};

if((_checkedMoney1 && CURRENT_CRIME_MONEY <= 0) || (_checkedMoney2 && _editMoney <= 0)) exitWith {["Du kannst dem Spieler kein €0 Ticket geben", "Ticket geben"] spawn life_fnc_message;};
if((_checkedMoney1 && CURRENT_CRIME_MONEY > 10000000) || (_checkedMoney2 && _editMoney > 10000000)) exitWith {["Du kannst dem Spieler kein Ticket im Wert von über €10.000000 geben", "Ticket geben"] spawn life_fnc_message;};
if((_checkedPerc1 && CURRENT_CRIME_PERC <= 0) || (_checkedPerc2 && _editPerc <= 0)) exitWith {["Du kannst dem Spieler kein 0% Ticket geben", "Ticket geben"] spawn life_fnc_message;};
if((_checkedPerc1 && CURRENT_CRIME_PERC > 5) || (_checkedPerc2 && _editPerc > 5)) exitWith {["Du kannst dem Spieler kein Ticket geben was mehr als 5% hat", "Ticket geben"] spawn life_fnc_message;};

private _moneyFinal = if(_checkedMoney1) then {CURRENT_CRIME_MONEY} else {_editMoney};
private _percFinal = if(_checkedPerc1) then {CURRENT_CRIME_PERC} else {_editPerc};
private _ticket = if(_checkedMoney1 || _checkedMoney2) then {["Geld", _moneyFinal]} else {["Prozent", _percFinal]};

TICKET_GIVEN = true;
closeDialog 0;
[player, CURRENT_CRIMINAL, CURRENT_CRIMES_TICKET, _ticket, _force] remoteExec ["HC_fnc_ticketGive", HC_LIFE];
[format ["Du hast einem Spieler ein Ticket gegeben!<br/><br/>Spieler: %1<br/>Art: %2<br/>Anzahl: %3", name CURRENT_CRIMINAL, _ticket select 0, _ticket select 1], "Ticket geben"] spawn life_fnc_message;