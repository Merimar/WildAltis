#include "..\script_macros.hpp"

private _time = SCHILD_DEALER getVariable["Zone_Dealer_Time", -1];
private _hasStarted = SCHILD_DEALER getVariable["Zone_Dealer_Start", false];
ZONEN_TIMER_THREAD = true;
if(_time isEqualTo -1) exitWith {};

for "_i" from 0 to 1 step 0 do {
    [format ["%1<t font = 'RobotoCondensed' color = '#D3E81E'><br/>                       %2</t>", [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString, "Zeit bis es los geht"], "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
    if(round(_time - time) < 1) exitWith {};
    sleep 0.08;
};

if(_hasStarted) exitWith {
if(player distance SCHILD_DEALER < 300) then {
life_curWep_h = currentWeapon player;
GE_VORBEI = true;
player action ["SwitchWeapon", player, player, 100];
};
private _winner = SCHILD_DEALER getVariable["Zone_Dealer_Winner", ""];
["Vorbei", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
if(_winner == ((group player) getVariable ["gang_name", ""])) then {
["Deine Gang hat den Gangfight gewonnen! Die Kampfhandlungen sind einzustellen!", "Gangfight"] spawn life_fnc_message;
titleText ["Deine Gang hat den Gangfight gewonnen!","PLAIN"];
}else {
["Deine Gang hat den Gangfight verloren! Die Kampfhandlungen sind einzustellen!", "Gangfight"] spawn life_fnc_message;
titleText ["Deine Gang hat den Gangfight verloren!","PLAIN"];
};
};
private _time = time + (10 * 60);
titleText["Der Kampf beginnt","PLAIN"];

for "_i" from 0 to 1 step 0 do {
    [format ["%1<t font = 'RobotoCondensed' color = '#D3E81E'><br/>                              %2</t>", [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString, "Kampfphase"], "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
    if(round(_time - time) < 1) exitWith {};
    sleep 0.08;
};

["Vorbei", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
GE_VORBEI = true;

private _winner = SCHILD_DEALER getVariable["Zone_Dealer_Winner", ""];
if(player distance SCHILD_DEALER < 300) then {
life_curWep_h = currentWeapon player;
player action ["SwitchWeapon", player, player, 100];
};
if(_winner == (group player) getVariable ["gang_name", ""]) then {
["Deine Gang hat den Gangfight gewonnen! Die Kampfhandlungen sind einzustellen!", "Gangfight"] spawn life_fnc_message;
titleText ["Deine Gang hat den Kampf um die Gangeroberung gewonnen!","PLAIN"];
}else {
["Deine Gang hat den Gangfight verloren! Die Kampfhandlungen sind einzustellen!", "Gangfight"] spawn life_fnc_message;
titleText ["Deine Gang hat den Gangfight verloren!","PLAIN"];
};