#include "..\..\Functions\script_macros.hpp"
disableSerialization;
private _value = ctrlText 3853;
private _index = lbCurSel 3854;
_value = parseNumber(_value);
private _tax = round(_value * LIFE_SETTINGS(getNumber,"bank_transferTax"));

if(_tax < 1) then {_tax = 0;};
if(_index isEqualTo -1) exitWith {};
private _data = lbData[3854, lbCurSel 3854];
if(_data == "-1") exitWith {};
private _unit = call compile format["%1",_data];
if (isNull _unit) exitWith {};
if (_value <= 100) exitWith {["Du musst mindestens €100 überweisen", "Üngültige Eingabe"] spawn life_fnc_message;};
if ((_value + _tax) > BANK) exitWith {["Du kannst die Überweisungskosten nicht bezahlen", "Kein Geld"] spawn life_fnc_message;};
if (TRANSFER_TIMER) exitWith {["Du kannst nur alle 5 Minuten etwas überweisen", "Überweisung"] spawn life_fnc_message;};

_action = ["Möchtest du diese Überweisung wirklich tätigen?", "Überweisung", "Überweisen", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

BANK = BANK - (_value + _tax);

[player, _unit, _value, _tax] remoteExecCall ["HC_fnc_transferMoney",HC_LIFE];
[format["Du hast €%1 von deinem Bankkonto an den Spieler %2 überweisen. Es sind insgesamt €%3 Überweisungskosten angefallen!", [_value] call life_fnc_numberText, name _unit, [_tax] call life_fnc_numberText], "Überweisung"] spawn life_fnc_message;
[] call life_fnc_atmMenu;

TRANSFER_TIMER = true;
sleep (5 * 60);
TRANSFER_TIMER = false;