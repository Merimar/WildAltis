disableSerialization;
private _action = ["Willst du wirklich die Feuerwehr rufen?","Feuerwehr","Ja","Abbrechen"] call BIS_fnc_guiMessage;

if(!_action) exitWith {};

life_corpse setVariable ["Revive", false, true];
[profileName] remoteExec ["life_fnc_medicRequest", independent];
["Ich bin gestorben und will wiederbelebt werden", independent, mapGridPosition life_corpse, getPos life_corpse] call life_fnc_newEmergency;

((findDisplay 7300) displayCtrl 7302) ctrlEnable false;