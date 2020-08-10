#include "..\script_macros.hpp"
private _state = param [0, false];
disableSerialization;
private _index = lbCurSel 5051;
private _amount = parseNumber (ctrlText 5053);

if(_state) then {_amount = 10;};
if(_index isEqualTo -1) exitWith {["Du hast keinen Gegenstand ausgewählt den du kaufen möchtest. Bitte wähle einen Gegenstand aus und versuche es erneut!", "Item Shop"] spawn life_fnc_message;};
if(_amount <= 0) exitWith {["Du musst mindestens einen Gegenstand kaufen.", "Item Shop"] spawn life_fnc_message;};

private _item = lbData [5051, _index];
private _buyPrice = [_item, "buyPrice"] call life_fnc_getItemPrice;
private _diff = [_item, _amount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;
private _price = _buyPrice * _diff;
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_diff <= 0) exitWith {["Du hast nicht genügend Platz in deinem Inventar um dir diesen Gegenstand zu kaufen.", "Item Shop"] spawn life_fnc_message;};
if(_price > CASH) exitWith {["Du kannst dir diese Items nicht leisten.", "Item Shop"] spawn life_fnc_message;};
if((time - life_action_delay) < 1) exitWith {playSound "error";};
life_action_delay = time;

private _nightDisabled = getArray (missionConfigFile >> "Life_Settings" >> "items_night_disabled");
if(_item in _nightDisabled && NIGHT) exitWith {["", "Der Unterhändler ist nachts deaktiviert"] spawn life_fnc_message;};

[true, _item, _diff] call life_fnc_handleInv;
CASH = CASH - _price;

[] call life_fnc_virt_update;
[format ["Du hast dir %2 %1 für €%3 gekauft.", _displayName, _diff, [_price] call life_fnc_numberText], "Item Shop"] spawn life_fnc_message;
playSound "buy";

[player, _item, _diff, _price] remoteExec ["HC_fnc_virtBuy", HC_LIFE];