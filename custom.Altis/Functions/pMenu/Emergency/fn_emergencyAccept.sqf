#include "..\..\script_macros.hpp"
disableSerialization;
private _display = findDisplay 1100;
private _playerList = _display displayCtrl 1101;
private _index = lbCurSel _playerList;
if(_index isEqualTo -1) exitWith {["Du musst einen Auftrag wählen!", "Notruf"] spawn life_fnc_message;};

private _value = _playerList lbValue _index;
_informationArray = bank_obj getVariable ["Emergency_Calls", []];
_information = _informationArray select _value;
if((_information select 4) != "-1") exitWith {["Dieser Auftrag wurde bereits angenommen", "Notruf"] spawn life_fnc_message;};

["Du hast den Auftrag angenommen!", "Notruf"] spawn life_fnc_message;
[player, _value] remoteExec ["HC_fnc_emergencyAccept", HC_LIFE];
sleep 0.2;
[] call life_fnc_openEmergencyMenu;