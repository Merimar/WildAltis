#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _amount = param [2, 0, [0]];
private _price = param [3, 0, [0]] * _amount;
private _shop = param [4, "", [""]];
private _filter = param [5, 0, [0]];

private _isHacker = [[_item, _shop], _unit, remoteExecutedOwner, "fn_buyWeapon"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

_config = switch (_filter) do {
	case 0 : {(getArray(missionConfigFile >> "CfgItemShop" >> _shop >> "uniform"));};
	case 1 : {(getArray(missionConfigFile >> "CfgItemShop" >> _shop >> "headgear"));};
	case 2 : {(getArray(missionConfigFile >> "CfgItemShop" >> _shop >> "goggles"));};
	case 3 : {(getArray(missionConfigFile >> "CfgItemShop" >> _shop >> "vest"));};
	case 4 : {(getArray(missionConfigFile >> "CfgItemShop" >> _shop >> "backpack"));};
	case 5 : {(getArray(missionConfigFile >> "CfgItemShop" >> _shop >> "weapons"));};
	case 6 : {(getArray(missionConfigFile >> "CfgItemShop" >> _shop >> "items"));};
};

private _itemInfo = [_item] call life_fnc_fetchCfgDetails;
private _itemName = _itemInfo select 1;

private _index = _config findIf {_x select 0 isEqualTo _item};
if(_index isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) kaufen, das Item wurde allerdings nicht gefunden", name _unit, getPlayerUID _unit, side _unit, _itemName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Weapon Buy Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Weapon Buy Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _truePrice = (_config select _index select 2) * _amount;

if(_truePrice != _price) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) kaufen, das Item hat allerdings einen anderen Kaufpreis (%5 < %6)", name _unit, getPlayerUID _unit, side _unit, _itemName, [_price] call HC_fnc_numberSafe, [_truePrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Weapon Buy Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Weapon Buy Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

_playerCash = [getPlayerUID _unit, "cash"] call HC_fnc_getMoney;

if(_playerCash < _truePrice) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) kaufen, der Spieler hat aber nicht genug Geld (%5 < %6)", name _unit, getPlayerUID _unit, side _unit, _itemName, [_playerCash] call HC_fnc_numberSafe, [_truePrice] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Weapon Buy Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Weapon Buy Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, "cash", _truePrice, false] call HC_fnc_handleMoney;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Item gekauft (ITEM: %4 AMOUNT: %5 PRICE: %6)", name _unit, getPlayerUID _unit, side _unit, _itemName, _amount, [_truePrice] call HC_fnc_numberSafe];
["BuyLog", _msg] call HC_fnc_Log;

sleep 1;

private _gear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, _gear] call HC_fnc_handleInv;