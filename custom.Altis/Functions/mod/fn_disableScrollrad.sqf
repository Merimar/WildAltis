bank_obj setVariable ["event_scroll", false, true];
["Du hast das Event Scrollrad deaktiviert", false, "slow"] call life_fnc_showNotification;

_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat das Event Scrollrad deaktiviert!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];

{
if(!((_x getVariable ["event_id", -1]) isEqualTo -1)) then {
[] remoteExec ["life_fnc_remoteScrollradClear", _x];
};
}foreach playableUnits;