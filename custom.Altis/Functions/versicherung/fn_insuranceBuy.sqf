#include "..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 2800;
private _list = _display displayCtrl 2801;
private _index = lbCurSel 2801;

if(_index isEqualTo -1) exitWith {["Du hast keine Auswahl getroffen", true, "slow"] call life_fnc_showNotification;};
private _dataArray = call compile format["%1", _list lbData _index];
private _vUID = _dataArray select 0;
private _classname = _dataArray select 1;
private _color = _dataArray select 2;
private _material = _dataArray select 3;

private _insurancePrice = [_classname, _color, _material] call life_fnc_getInsurancePrice;
if(_insurancePrice > BANK) exitWith {["Du hast nicht genug Geld auf der Bank", "Versicherung"] spawn life_fnc_message;};

private _action = ["Möchtest du das Fahrzeug wirklich versichern lassen?", "Fahrzeug Versichern?", "Versichern", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

["Du hast dein Fahrzeug versichern lassen, es steht nun wieder in deiner Garage", "Versicherung"] spawn life_fnc_message;
[player, _vUID, _insurancePrice] remoteExec ["HC_fnc_insureVehicle", HC_LIFE];

BANK = BANK - _insurancePrice;
closeDialog 0;