_message = ctrlText 130005;
bank_obj setVariable ["Event_Message_X", _message, true];
["Nachricht erfolgreich gespeichert!", false, "slow"] call life_fnc_showNotification;