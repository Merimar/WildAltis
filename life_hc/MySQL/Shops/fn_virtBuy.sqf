#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _amount = param [2, 0, [0]];
private _price = param [3, 0, [0]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_virtBuy"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _finalPrice = ([_item, "buyPrice"] call HC_fnc_getItemPrice) * _amount;
private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_price != _finalPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) kaufen, das Item hat allerdings einen anderen Kaufpreis (%5 < %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, [_price] call HC_fnc_numberSafe, [_finalPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "VirtBuy Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VirtBuy Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _playerCash = [getPlayerUID _unit, side _unit, "cash"] call HC_fnc_getMoney;

if(_playerCash < _finalPrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) kaufen, hat aber nicht genug Geld (%5 < %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, [_playerCash] call HC_fnc_numberSafe, [_finalPrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "VirtBuy Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VirtBuy Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, side _unit, "cash", _finalPrice, false] call HC_fnc_handleMoney;
[getPlayerUID _unit, side _unit, _item, _amount, true] call HC_fnc_handleVirt;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Item gekauft (ITEM: %4 AMOUNT: %5 PRICE: %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, _amount, [_finalPrice] call HC_fnc_numberSafe];
["BuyLog", _msg] call HC_fnc_Log;