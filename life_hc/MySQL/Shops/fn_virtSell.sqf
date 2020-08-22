#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _amount = param [2, 0, [0]];
private _price = param [3, 0, [0]];
private _infostand = param [4, objNull, [objNull]];
private _shopType = param [5, "", [""]];

private _isHacker = [[_item, _shopType], _unit, remoteExecutedOwner, "fn_virtSell"] call HC_fnc_checkSQLBreak;
if(_isHacker || _amount <= 0) exitWith {};

private _finalPrice = ([_item, "sellPrice"] call HC_fnc_getItemPrice) * _amount;
if(_shopType == "gangdealer" && GANG_DEALER) then {_finalPrice = round (_finalPrice * 1.2);};

private _itemType = getText (missionConfigFile >> "Items" >> _item >> "type");
if(_itemType == "MARKT" && (_unit getVariable ["player_playtime", 0]) <= 600) then {_finalPrice = round (_finalPrice * 1.2);};

private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_price != _finalPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) verkaufen, das Item hat allerdings einen anderen Verkaufspreis (%5 < %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, [_price] call HC_fnc_numberSafe, [_finalPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "VirtSell Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VirtSell Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _pItems = [getPlayerUID _unit, _item] call HC_fnc_countVirt;

if(_pItems < _amount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) verkaufen, hat aber nicht genug Items (%5 < %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, [_pItems] call HC_fnc_numberSafe, [_amount] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "VirtSell Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VirtSell Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

/*
if(isNull _infostand || {typeOf _infostand != "Land_InfoStand_V2_F" || _infostand distance _unit > 20}) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) verkaufen, ist aber zu weit vom Schild entfernt (%5m)", name _unit, getPlayerUID _unit, side _unit, _displayName, _infostand distance _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Sell Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Sell Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};
*/

[getPlayerUID _unit, "cash", _finalPrice, true] call HC_fnc_handleMoney;
[getPlayerUID _unit, _item, _amount, false] call HC_fnc_handleVirt;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Item verkauft (ITEM: %4 AMOUNT: %5 PRICE: %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, _amount, [_finalPrice] call HC_fnc_numberSafe];
["SellLog", _msg] call HC_fnc_Log;

[_item, _amount] call HC_fnc_handleMarkt;