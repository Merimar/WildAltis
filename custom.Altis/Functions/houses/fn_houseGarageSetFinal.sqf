private _action = ["Möchtest du den Spawnpunkt hier setzen?", "Spawnpunkt setzen", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {titleText ["Plazierung abgebrochen", "PLAIN"];};

[player, CURRENT_HOUSE_TARGET, GARAGE_SETTING_TYPE, getPos player, getDir player] remoteExec ["HC_fnc_houseGarageSet", HC_LIFE];
["Du hast den Spawnpunkt für deine Garage erfolgreich gesetzt!", "Garage"] spawn life_fnc_message;