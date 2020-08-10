_message = bank_obj getVariable ["Event_Message_X", ""];

if(_message == "") exitWith {
["Keine Nachricht angegeben!", true, "slow", "#FF0000", "Fehler"] call life_fnc_showNotification;
};

[_message, "Neue Eventnachricht"] remoteExec ["life_fnc_message", -2];

_msg = format ["Der Spieler %1 (%2 - %3) hat eine Event Nachricht an alle geschickt: %5", profileName, getPlayerUID player, playerSide, _message];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];