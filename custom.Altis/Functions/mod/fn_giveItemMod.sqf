#include "..\script_macros.hpp"
_type = _this select 0;
_loadout = player getVariable ["Event_Loadout", []];

if(_loadout isEqualTo []) exitWith {
["Kein Loadout gespeichert", true, "slow"] call life_fnc_showNotification;
};

if(_type isEqualTo 1) then {
["Du hast allen Event Teilnehmern dein Gear gegeben!", false, "slow"] call life_fnc_showNotification;
_pls = [];
{if(_x getVariable ["event_join", false]) then {_pls pushBack _x;};} forEach playableUnits;
[player, _pls, _loadout] remoteExec ["HC_fnc_adminGiveGear", HC_LIFE];
};

if(_type isEqualTo 2) then {
["Du hast allen Event Teilnehmern in einem Radius (10m) dein Gear gegeben!", false, "slow"] call life_fnc_showNotification;
_pls = [];
{if((_x getVariable ["event_join", false]) && (player distance _x) <= 10) then {_pls pushBack _x;};} forEach playableUnits;
[player, _pls, _loadout] remoteExec ["HC_fnc_adminGiveGear", HC_LIFE];
};

disableSerialization;
_display = findDisplay 150000;
_Btn = _display displayCtrl 150008;

if(_type isEqualTo 3) then {
_xe = player getVariable ["Event_F", false];
if(!(_xe)) then {
player setVariable ["Event_F", true, true];
["Klicke Leute mit F3 an, um Ihnen dein gespeichertet Gear zu geben!", false, "slow"] call life_fnc_showNotification;
_Btn ctrlSetBackgroundColor [0.1, 1, 0, 0.8];
}else {
player setVariable ["Event_F", false, true];
["Du hast den F3 Modus deaktiviert!", false, "slow"] call life_fnc_showNotification;
_Btn ctrlSetBackgroundColor [1, 0.1, 0, 0.8];
};
};