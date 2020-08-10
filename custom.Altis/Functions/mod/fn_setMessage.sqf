_message = ctrlText 110005;
bank_obj setVariable ["Scroll_Message", _message, true];
["Nachricht erfolgreich gespeichert!", true, "slow"] call life_fnc_showNotification;

_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat eine Event Nachricht festgelegt: %3", _name, getPlayerUID player, _message];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];