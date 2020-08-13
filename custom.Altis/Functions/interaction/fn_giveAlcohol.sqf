#include "..\script_macros.hpp"
private _unit = param [0, objNull];

if(isNull _unit) exitWith {};

private _item = switch (true) do {case ((["bier"] call life_fnc_getItemValue) > 0) : {"bier"};case ((["wodka"] call life_fnc_getItemValue) > 0) : {"wodka"};default {""};};
if(_item == "") exitWith {["", "Du hast keinen Alkohol"] spawn life_fnc_message;};

[false, _item, 1] call life_fnc_handleInv;
[player, _item] remoteExec ["HC_fnc_useItem", HC_LIFE];
[format ["Du hast den Spieler %1 alkoholisiert.", name _unit], "Alkohol"] spawn life_fnc_message;
[format["Der Spieler %1 hat dich alkoholisiert.", profileName], false] remoteExec ["life_fnc_remoteDrug", _unit];