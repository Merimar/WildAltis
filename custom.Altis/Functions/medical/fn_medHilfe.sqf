closeDialog 0;
if(CASH < 100) exitWith {titleText ["Dich zu heilen kostet €100", "PLAIN"];};

[] spawn {

titleText ["Bewege dich nicht", "PLAIN"];
private _exit = false;

sleep 0.5;
for "_int" from 1 to 3 step 1 do {if(speed player > 0) exitWith {_exit = true;};sleep 1;};

if(_exit) exitWith {titleText ["Du hast dich bewegt", "PLAIN"];};
if(CASH < 100) exitWith {titleText ["Dich zu heilen kostet €100", "PLAIN"];};

titleText ["Der Doktor hat dich geheilt. Du hast €100 bezahlt!", "PLAIN"];
CASH = CASH - 100;
[player, objNull, true] remoteExec ["HC_fnc_healPlayer", HC_LIFE];
};