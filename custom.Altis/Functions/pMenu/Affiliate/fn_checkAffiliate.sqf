#include "..\..\script_macros.hpp"
private _key = ctrlText 1052;

if(count _key != 15) exitWith {["Der Code muss 15 Zeichen lang sein", "Affiliate"] spawn life_fnc_message;};
if(AFFILIATE_TIMER) exitWith {["Du kannst nur alle 5 Minuten einen Code eingeben.", "Affiliate"] spawn life_fnc_message;};

[] spawn {
AFFILIATE_TIMER = true;
sleep (5 * 60);
AFFILIATE_TIMER = false;
};

[player, _key, true] remoteExec ["HC_fnc_authAffiliate", HC_LIFE];