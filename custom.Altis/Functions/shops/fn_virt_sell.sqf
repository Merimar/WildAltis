#include "..\script_macros.hpp"
disableSerialization;
private _sellAll = param [0, false];
private _index = lbCurSel 5052;

if(_index isEqualTo -1) exitWith {["Du hast keinen Gegenstand ausgewählt den du verkaufen möchtest. Bitte wähle einen Gegenstand aus und versuche es erneut!", "Item Shop"] spawn life_fnc_message;};

private _item = lbData [5052, _index];
private _itemAmount = [_item] call life_fnc_getItemValue;
private _sellPrice = [_item, "sellPrice"] call life_fnc_getItemPrice;
private _amount = if(_sellAll) then {_itemAmount} else {parseNumber (ctrlText 5054)};
private _price = _sellPrice * _amount;
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_amount > _itemAmount) then {_amount = _itemAmount};
if(_amount <= 0) exitWith {["Du musst mindestens einen Gegenstand verkaufen.", "Item Shop"] spawn life_fnc_message;};
if((time - life_action_delay) < 1) exitWith {};
life_action_delay = time;

if(life_shop_type == "gangdealer") then {_price = round (_price * 1.2);};

[false, _item, _amount] call life_fnc_handleInv;
CASH = CASH + _price;

[format ["Du hast %2 %1 für €%3 verkauft.", _displayName, _amount, [_price] call life_fnc_numberText], "Item Shop"] spawn life_fnc_message;
playSound "buy";

[player, _item, _amount, _price, life_shop_npc, life_shop_type] remoteExec ["HC_fnc_virtSell", HC_LIFE];
[] call life_fnc_virt_update;