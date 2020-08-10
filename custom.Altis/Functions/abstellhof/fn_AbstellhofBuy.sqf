disableSerialization;
private _display = findDisplay 2800;
private _list = _display displayCtrl 2801;
private _index = lbCurSel 2801;

if(_index isEqualTo -1) exitWith {["Du musst ein Fahrzeug auswählen.", "Abstellhof"] spawn life_fnc_message;};
private _dataArray = call compile format["%1", _list lbData _index];
private _vUID = _dataArray select 0;
private _classname = _dataArray select 1;
private _impoundPrice = [_classname] call life_fnc_getAbstellhofPrice;

if(_impoundPrice > BANK) exitWith {["Du hast nicht genug Geld auf der Bank", "Abstellhof"] spawn life_fnc_message;};
private _action = ["Möchtest du das Fahrzeug wirklich freikaufen?", "Fahrzeug Freikaufen?", "Freikaufen", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

["Du hast dein Fahrzeug freigekauft, es steht nun wieder in deiner Garage", "Abstellhof"] spawn life_fnc_message;
[player, _vUID, _impoundPrice] remoteExec ["HC_fnc_abstellVehicle", HC_LIFE];

BANK = BANK - _impoundPrice;
closeDialog 0;