disableSerialization;
private _display = findDisplay 1100;
private _playerList = _display displayCtrl 1101;
private _message = ctrlText 1106;
private _index = lbCurSel _playerList;

if(count _message < 5) exitWith {["Du musst eine Nachricht eingeben welche länger als 5 Zeichen ist!", "Notruf"] spawn life_fnc_message;};
if(_index isEqualTo -1) exitWith {["Du musst einen Auftrag wählen!", "Notruf"] spawn life_fnc_message;};

private _value = _playerList lbValue _index;
private _informationArray = bank_obj getVariable ["Emergency_Calls", []];
private _information = _informationArray select _value;
if(_information select 5) exitWith {["Dieser Auftrag ist bereits bearbeitet worden", "Notruf"] spawn life_fnc_message;};

[player, _value, _message] remoteExec ["HC_fnc_emergencySendMessage", HC_LIFE];
sleep 0.2;
[] call life_fnc_openEmergencyMenu;