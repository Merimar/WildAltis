disableSerialization;
if(call life_adminlevel < 5) exitWith {};
private _action = ["ACHTUNG: Willst du wirklich das Martkevent beenden", "Marktevent beenden", "Ja", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

[player] remoteExec ["HC_fnc_endFarmEvent", HC_LIFE];
closeDialog 0;