private _unit = param [0, objNull];
if(isNull _unit) exitWith {};

["", "Durchsuche den Spieler ..."] spawn life_fnc_message;
sleep 2;
if(player distance _unit > 5 || life_isDead || !alive _unit) exitWith {["", "Du hast dich zu weit entfernt"] spawn life_fnc_message;};

[player, _unit] remoteExec ["HC_fnc_searchUpdate", HC_LIFE];