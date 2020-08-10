private _cop = param [0, objNull, [objNull]];
private _time = param [1, 10, [0]];
private _geheimZahl = param [2, -1, [0]];
private _relog = param [3, false, [false]];

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};
if(!(isNull _cop)) then {[format ["Du wurdest von %1 für %2 Minuten ins Gefängnis gesteckt", name _cop, _time], "Gefängnis"] spawn life_fnc_message;};

JAIL_TIME = _time;
STONE_MAX_COUNTER = _time * 12;
STONE_COUNTER = 0;

waitUntil {!_relog || player distance (markerPos "jail_marker") < 100};

private _endTime = time + (60 * _time);
waitUntil {
[[(_endTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString, "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
(_endTime <= time || life_isDead || player distance (markerPos "jail_marker") > 100)
};

if(life_isDead) exitWith {
["Da du gestorben bist, musst du deine Zeit nocheinmal absitzen", "Gefängnis"] spawn life_fnc_message;
[player, "DEAD"] remoteExec ["HC_fnc_jailOutcome", HC_LIFE];
};

JAIL_TIME = 0;

if(player distance (markerPos "jail_marker") > 100) exitWith {
["Du bist aus dem Gefängnis geflohen", "Gefängnis"] spawn life_fnc_message;
[player, "FLEE"] remoteExec ["HC_fnc_jailOutcome", HC_LIFE];
};

["Du hast deine Zeit abgesessen", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
["Du hast deine Zeit abgesessen, deine Rebellenlizenz wurde abgezogen!", "Gefängnis"] spawn life_fnc_message;
[player, "NORMAL"] remoteExec ["HC_fnc_jailOutcome", HC_LIFE];
LICENSES = LICENSES - ["rebel"];