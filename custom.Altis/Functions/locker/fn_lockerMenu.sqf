disableSerialization;
if(!("haus" in LICENSES)) exitWith {["", "Du brauchst eine Hauseigentümer Lizenz"] spawn life_fnc_message;};
if(LOCKER_TIMER) exitWith {["Du kannst nur alle 30 Sekunden in dein Schliesfach schauen", "Schliesfach"] spawn life_fnc_message};
LOCKER_TIMER = true;
[] spawn {
sleep 30;
LOCKER_TIMER = false;
};

if(!isNull findDisplay 398000) exitWith {};
createDialog "Locker";
private _display = findDisplay 398000;
private _header = _display displayCtrl 398001;

_header ctrlSetText format ["%1's Schliesfach", profileName];

[2] call life_fnc_lockerTab;