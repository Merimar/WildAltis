disableSerialization;
private _display = findDisplay 4200;
private _group = group player;

_action = ["Möchtest du die Gang wirklich verlassen", "Gang verlassen", "Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

["", "Du hast die Gang verlassen"] spawn life_fnc_message;
[player, _group] remoteExec ["HC_fnc_gangLeave", HC_LIFE];
closeDialog 0;