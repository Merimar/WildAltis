disableSerialization;
if(call life_adminlevel < 5) exitWith {};
private _newValue = parseNumber (ctrlText 1254);
private _item = lbData [1251, lbCurSel 1251];

if(_newValue <= 0 || _item == "") exitWith {["", "Du musst eine positive Zahl bei 'Neuer Verkauspreis' eingeben"] spawn life_fnc_message;};

private _action = ["ACHTUNG: Diese Funktion ändert den Verkaufspreis", "Neuen Preis festlegen", "Ja", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

[player, _newValue, _item] remoteExec ["HC_fnc_setFarmKurs", HC_LIFE];
closeDialog 0;