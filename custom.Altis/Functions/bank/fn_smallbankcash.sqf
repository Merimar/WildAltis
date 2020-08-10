#include "..\script_macros.hpp"
_vault = _this select 0;
_money = _this select 1;
_geheimZahl = _this select 2;

if(!(_geheimZahl isEqualTo life_geheimZahl)) exitWith {};
[format [["Du hast der Bank €%1 geraubt, ueberlebe die naechsten 15 Minuten um das Geld ausgezahlt zu bekommen"] call life_fnc_getCleanString, [_money] call life_fnc_numberText], false, "slow"] call life_fnc_showNotification;

disableSerialization;
_time = time + (15 * 60);
_bad = false;

for "_i" from 0 to 1 step 0 do {
	if(life_isDead) exitWith {_bad = true;};
	if(player getVariable ["restrained", false]) exitWith {_bad = true;};
    if (round(_time - time) < 1) exitWith {};
    sleep 0.08;
};

if(_bad) exitWith {
player setVariable ["Bank_geschafft", false, true];
["Bankraub gescheitert", false, "slow"] call life_fnc_showNotification;
};

player setVariable ["Bank_geschafft", true, true];
[format ["Du hast €%1 bekommen!", [_money] call life_fnc_numberText], false, "slow"] call life_fnc_showNotification;
CASH = CASH + _money;



