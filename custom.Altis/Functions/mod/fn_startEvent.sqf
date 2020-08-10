private _message = ctrlText 120003;
[_message, "Neue Eventnachricht"] remoteExec ["life_fnc_message", -2];
bank_obj setVariable ["event_start", true, true];

if(bank_obj getVariable ["event_countdown", false]) then {[] spawn life_fnc_startEventCountdown;};

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Event gestartet!", profileName, getPlayerUID player, playerSide];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];