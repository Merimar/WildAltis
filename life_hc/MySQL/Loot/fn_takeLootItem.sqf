#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _data = param [1, "", [""]];
private _value = param [2, 0, [0]];
private _leiche = param [3, objNull, [objNull]];
private _leicheUID = param [4, "", [""]];

private _isHacker = [[_data, _leicheUID], _unit, remoteExecutedOwner, "fn_takeLootItem"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _leiche) exitWith {};

private _itemName = getText (missionConfigFile >> "Items" >> _data >> "name");
private _index = MONEY_PICKUP findIf {_x select 0 == _leicheUID};

if(_index isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte aus einer Leiche %4 %5 rausnehmen, es existiert allerdings gar keine Leiche", name _unit, getPlayerUID _unit, side _unit, _value, _itemName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "ItemPickup Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein ItemPickup Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _informationArray = MONEY_PICKUP select _index;
private _playerUID = _informationArray select 0;
private _playerName = _informationArray select 1;
private _playerItems = _informationArray select 2;
private _playerMoney = _informationArray select 3;
private _playerSide = _informationArray select 4;
private _nearUnits = (nearestObjects[_unit, ["Man"], 15]) arrayIntersect playableUnits;

if(count _nearUnits > 1) exitWith {
private _otherPlayer = (_nearUnits select {_x != _unit}) select 0;
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte aus einer Leiche %4 (%5 - %6) %7 %8 rausnehmen, es steht allerdings ein Spieler in seiner Naehe: %9 (%10 - %11)", name _unit, getPlayerUID _unit, side _unit, _playerName, _playerUID, _playerSide, _value, _itemName, name _otherPlayer, getPlayerUID _otherPlayer, side _otherPlayer];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "ItemPickup Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein ItemPickup Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _itemIndex = _playerItems findIf {_x select 0 == _data};
private _checkValue = if(_itemIndex isEqualTo -1) then {0} else {_playerItems select _itemIndex select 1};

if(_checkValue < _value) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte aus einer Leiche %4 (%5 - %6) %7 %8 rausnehmen, die Leiche hat allerdings nicht soviele Items", name _unit, getPlayerUID _unit, side _unit, _playerName, _playerUID, _playerSide, _value, _itemName];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "ItemPickup Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein ItemPickup Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

(_playerItems select _index) set [1, _checkValue - _value];
_leiche setVariable ["Loot_Information", [_playerUID, _playerName, _playerItems, _playerMoney], true];
[getPlayerUID _unit, side _unit, _data, _value, true] call HC_fnc_handleVirt;

if(_playerSide isEqualTo west && (side _unit) in [civilian, east]) then {
_msg = format ["Der Polizist %1 (%2 - %3) ist mit Items auf der Hand gestorben (ITEM: %4 AMOUNT: %5) und wurde von einem Zivilisten %6 (%7 - %8) gelootet", _playerName, _playerUID, _playerSide, _itemName, _value, name _unit, getPlayerUID _unit, side _unit];
["CopLog", _msg] call HC_fnc_Log;
};

_msg = format ["Der Spieler %1 (%2 - %3) hat die Leiche des Spielers %4 (%5 - %6) gelootet und folgende Items bekommen: %7 %8", name _unit, getPlayerUID _unit, side _unit, _playerName, _playerUID, _playerSide, _value, _itemName];
["LootLog", _msg] call HC_fnc_Log;