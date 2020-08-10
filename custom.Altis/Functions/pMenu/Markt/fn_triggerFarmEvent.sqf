disableSerialization;
if(call life_adminlevel < 5) exitWith {};
private _item = lbData [1251, lbCurSel 1251];

if(_item == "") exitWith {["", "Du musst ein Item auswählen"] spawn life_fnc_message;};

private _action = ["ACHTUNG: Willst du wirklich ein Martkevent starten", "Marktevent starten", "Ja", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

[player, _item] remoteExec ["HC_fnc_triggerFarmEvent", HC_LIFE];
closeDialog 0;