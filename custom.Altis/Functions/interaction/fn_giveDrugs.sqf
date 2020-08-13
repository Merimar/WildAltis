#include "..\script_macros.hpp"
private _unit = param [0, objNull];

if(isNull _unit) exitWith {};

private _item = switch (true) do {case ((["kokainP"] call life_fnc_getItemValue) > 0) : {"kokainP"};case ((["heroinP"] call life_fnc_getItemValue) > 0) : {"heroinP"};case ((["marihuanaP"] call life_fnc_getItemValue) > 0) : {"marihuanaP"};default {""};};
if(_item == "") exitWith {["", "Du hast keine Drogen"] spawn life_fnc_message;};

[false, _item, 1] call life_fnc_handleInv;
[player, _item] remoteExec ["HC_fnc_useItem", HC_LIFE];
[format ["Du hast den Spieler %1 unter Drogen gesetzt", name _unit], "Drogen"] call life_fnc_message;
[format["Der Spieler %1 hat dich unter Drogen gesetzt", profileName], true] remoteExec ["life_fnc_remoteDrug", _unit];