disableSerialization;
private _bugreport = ctrlText 4051;

if(count _bugreport < 10) exitWith {["Deine Nachricht muss mindestens 10 Zeichen lang sein!", "Bugreport"] spawn life_fnc_message;};
if(BUG_REPORT_TIMER) exitWith {["Du kannst nur alle 10 Minuten einen Bugreport abschicken!", "Bugreport"] spawn life_fnc_message;};
[] spawn {
BUG_REPORT_TIMER = true;
sleep 600;
BUG_REPORT_TIMER = false;
};

[player, _bugreport] remoteExec ["HC_fnc_reportReceive", HC_LIFE];
[_bugreport, "Bugreport gesendet"] spawn life_fnc_message;