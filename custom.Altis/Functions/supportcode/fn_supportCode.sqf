disableSerialization;

private _display = findDisplay 444000;
private _edit = _display displayCtrl 444001;
private _eingabe = ctrlText _edit;

if(count _eingabe < 3) exitWith {};
if(SUPPORT_TIMER) exitWith {["Du kannst nur jede Minute einen Supportcode abschicken", "Supportcode"] spawn life_fnc_message;};
[] spawn {SUPPORT_TIMER = true;sleep 60;SUPPORT_TIMER = false;};

[player, _eingabe] remoteExec ["HC_fnc_supportCode", HC_LIFE];
closeDialog 0;