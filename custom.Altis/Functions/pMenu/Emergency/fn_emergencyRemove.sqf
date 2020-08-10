#include "..\..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 1100;
private _playerList = _display displayCtrl 1101;
private _index = lbCurSel _playerList;
if(_index isEqualTo -1) exitWith {};

private _value = _playerList lbValue _index;
private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
private _information = _informationArray select _value;
_information set [5, true];
bank_obj setVariable ["Emergency_Calls", _informationArray, true];

["Du hast den Auftrag gelöscht", "Notruf"] spawn life_fnc_message;
sleep 0.2;
[] call life_fnc_openEmergencyMenu;