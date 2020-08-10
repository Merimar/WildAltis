#include "..\script_macros.hpp"
disableserialization;
if((lbCurSel 3751) isEqualTo -1) exitWith {["Du hast keinen Slot ausgewählt.", "Loadout"] spawn life_fnc_message;};
if((time - life_action_delay) < 15) exitWith {["Du kannst nur alle 15 Sekunden ein Loadout laden.", "Loadout"] spawn life_fnc_message;};
life_action_delay = time;
private _curSel = (lbCurSel 3751) + 1;

private _index = life_allLoadouts findIf {(_x select 1) isEqualTo _curSel};
if(_index isEqualTo -1) exitWith {["Das Loadout ist leer", "Loadout"] spawn life_fnc_message;};

private _loadout = life_allLoadouts select _index select 0;
private _price = [_loadout] call life_fnc_getLoadoutPrice;

if(_price > BANK) exitWith {["Du hast nicht genug Geld auf dem Konto.", "Loadout"] spawn life_fnc_message;};

private _action = ["Möchtest du das Loadout wirklich kaufen?", "Loadout kaufen?", "Kaufen", "Abbrechen"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};

[player, _curSel, _price] remoteExec ["HC_fnc_getLoadout", HC_LIFE];