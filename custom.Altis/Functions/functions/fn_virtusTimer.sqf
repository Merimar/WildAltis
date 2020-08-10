while {true} do {
if(player inArea "VirtusZone") then {
private _time = bank_obj getVariable ["Virtuszone", -1];
while {player inArea "VirtusZone"} do {
    [[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString, "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
    if(round(_time - time) < 1) exitWith {};
    sleep 0.08;
};
["Zone verlassen", "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
};
sleep 1;
};