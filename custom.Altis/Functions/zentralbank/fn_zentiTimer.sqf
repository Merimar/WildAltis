#include "..\script_macros.hpp"
disableSerialization;
private _curTime = _this select 0;
private _faction = _this select 1;
private _time = _curTime + (15 * 60);

if(_faction isEqualTo 0) then {["Die Zentralbank wird ausgeraubt", "Zentralbank"] spawn life_fnc_message;};

for "_i" from 0 to 1 step 0 do {
	[[(_time - servertime),"MM:SS.MS"] call BIS_fnc_secondsToString, "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa"] spawn life_fnc_sideMessage;
    if(round(_time - servertime) < 1 || !(zenti getVariable ["bombe", false])) exitWith {};
    sleep 0.08;
};

if(zenti getVariable ["bombe", false]) exitWith {
if(_faction isEqualTo 0) exitWith {["Die Zentralbank wurde nicht erfolgreich verteidigt", "Zentralbank"] spawn life_fnc_message;};
["Der Raub war erfolgreich", "Zentralbank"] spawn life_fnc_message;
};

if(_faction isEqualTo 0) exitWith {["Die Zentralbank wurde erfolgreich verteidigt", "Zentralbank"] spawn life_fnc_message;};
["Der Raub ist fehlgeschlagen", "Zentralbank"] spawn life_fnc_message;