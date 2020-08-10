disableSerialization;
private _display = findDisplay 3950;
private _question = ctrlText (_display displayCtrl 3953);

if(count _question < 5) exitWith {["Deine Frage muss min. 6 Zeichen haben", "FAQ"] spawn life_fnc_message;};
if("'" in _question) exitWith {["In deiner Frage darf kein Apostroph sein", "FAQ"] spawn life_fnc_message;};
if((time - life_action_delay) < 60) exitWith {playSound "error";};
life_action_delay = time;

[player, _question] remoteExec ["HC_fnc_reportReceive", HC_LIFE];
[_question, "Deine Frage wurde gesendet"] spawn life_fnc_message;