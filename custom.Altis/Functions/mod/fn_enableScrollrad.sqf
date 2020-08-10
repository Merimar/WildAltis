_message = bank_obj getVariable ["Scroll_Message", ""];
_position = bank_obj getVariable ["Scroll_Pos", []];

if(_message == "") exitWith {
_msg = "Es wurde kein Scrollrad Text festgelegt."; 
[_msg, true, "slow", "#FF0000", "Fehler"] call life_fnc_showNotification;
};
if(_pos isEqualTo []) exitWith {
_msg = "Es wurde keine Position gespeichert."; 
[_msg, true, "slow", "#FF0000", "Fehler"] call life_fnc_showNotification;
};

_msg = "Du hast das Event Scrollrad aktiviert."; 
[_msg, false, "slow"] call life_fnc_showNotification;
bank_obj setVariable ["event_scroll", true, true];

_name = profileName;
_msg = format ["Der Spieler %1 (%2) hat das Event Scrollrad aktiviert!", _name, getPlayerUID player];
[player, _msg] remoteExec ["HC_fnc_modLog", HC_LIFE];

_display = findDisplay 110000;
_checkbox = _display displayCtrl 110006;
_clearPInv = cbChecked _checkbox;

{
_id = _x getVariable ["event_id", -1];
if(_id isEqualTo -1) then {
[_message, _clearPInv] remoteExecCall ["life_fnc_remoteScrollrad", _x];
};
}foreach playableUnits;