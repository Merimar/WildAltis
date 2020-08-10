disableSerialization;
private _display = findDisplay 2800;
private _list = _display displayCtrl 2801;
private _index = lbCurSel 2801;

if(_index isEqualTo -1) exitWith {["Du musst ein Fahrzeug auswählen.", "Schrottplatz"] spawn life_fnc_message;};
private _dataArray = call compile format["%1", _list lbData _index];
private _vUID = _dataArray select 0;
private _classname = _dataArray select 1;
private _color = _dataArray select 2;
private _material = _dataArray select 3;

private _junkPrice = [_classname, _color, _material] call life_fnc_getJunkPrice;
if (_junkPrice > BANK) exitWith {["Du hast nicht genug Geld auf der Bank", "Schrottplatz"] spawn life_fnc_message;};

private _action = ["Möchtest du das Fahrzeug wirklich reparieren lassen?", "Fahrzeug Reparieren?", "Reparieren", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

["Du hast dein Fahrzeug reparieren lassen, es steht nun wieder in deiner Garage", "Schrottplatz"] spawn life_fnc_message;
[player, _vUID, _junkPrice] remoteExec ["HC_fnc_junkVehicle", HC_LIFE];

BANK = BANK - _junkPrice;
closeDialog 0;