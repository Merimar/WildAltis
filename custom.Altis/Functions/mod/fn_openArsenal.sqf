#include "..\script_macros.hpp"
closeDialog 0;
["Open",true] spawn BIS_fnc_arsenal;
["Du hast das Arsenal geoeffnet", false, "slow"] call life_fnc_showNotification;

private _msg = format ["Der Spieler %1 (%2 - %3) hat das Arsenal geoeffnet", profileName, getPlayerUID player, playerSide];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];
player setVariable ["Arsenal", true, true];