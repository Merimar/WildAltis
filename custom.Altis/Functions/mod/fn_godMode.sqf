#include "..\script_macros.hpp"
private _state = player getVariable ["god_mode", false];
private _prefix = if(_state) then {"deaktiviert"} else {"aktiviert"};
[player, format ["Der Spieler %1 (%2 - %3) hat den Godmode %4", profileName, getPlayerUID player, playerSide, _prefix], ""] remoteExec ["HC_fnc_modLog", HC_LIFE];
player allowDamage _state;
player setVariable ["god_mode", !_state, true];

["", format ["Godmode %1", _prefix]] spawn life_fnc_message;