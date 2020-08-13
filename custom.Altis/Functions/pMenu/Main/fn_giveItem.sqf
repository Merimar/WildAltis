#include "..\..\script_macros.hpp"
disableSerialization;
private _curSelItem = lbCurSel 4351;
private _curSelPlayer = lbCurSel 4353;
private _amount = parseNumber (ctrlText 4354);

if(_curSelItem isEqualTo -1 || _curSelPlayer isEqualTo -1 || _amount <= 0) exitWith {["", "Du hast nichts augewählt"] spawn life_fnc_message;};

private _item = lbData [4351, _curSelItem];
private _unit = call compile format["%1", lbData [4353, _curSelPlayer]];

if(([_item] call life_fnc_getItemValue) < _amount) exitWith {["", "Soviele Items besitzt du nicht"] spawn life_fnc_message;};
if(isNull _unit) exitWith {["", "Der Spieler ist nicht mehr auf der Insel"] spawn life_fnc_message;};
if(player distance _unit > 15) exitWith {["", "Der Spieler ist auserhalb deiner Reichweite"] spawn life_fnc_message;};
if(itemGive_TIMER) exitWith {["", "Du kannst nur alle 5 Sekunden Items geben"] spawn life_fnc_message;};

[] spawn {itemGive_TIMER = true;sleep 5;itemGive_TIMER = false;};

[false, _item, _amount] call life_fnc_handleInv;

private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");
[format["Du hast dem Spieler %1 %2 %3 gegeben", name _unit, _amount, _displayName], "Item gegeben"] spawn life_fnc_message;
[] call life_fnc_openZInv;

[player, _unit, _item, _amount, true] remoteExec ["HC_fnc_giveVirt", HC_LIFE];