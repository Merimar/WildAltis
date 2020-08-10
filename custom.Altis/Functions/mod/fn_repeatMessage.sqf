_time = parseNumber (ctrlText 130006);
_time = _time * 60;

_message = bank_obj getVariable ["Event_Message_X", ""];
_id = bank_obj getVariable ["Event_Message_ID", -1];
_id = _id + 1;
bank_obj setVariable ["Event_Message_ID", _id, true];
if(_message == "") exitWith {
["Keine Nachricht gespeichert", true, "slow", "#FF0000", "Fehler"] call life_fnc_showNotification;
};

while {true} do {
_curID = bank_obj getVariable ["Event_Message_ID", -1];
if(!(_curID isEqualTo _id)) exitWith {};
_message = bank_obj getVariable ["Event_Message_X", ""];
[_message, "Neue Eventnachricht"] remoteExec ["life_fnc_message", -2];
sleep _time;
};