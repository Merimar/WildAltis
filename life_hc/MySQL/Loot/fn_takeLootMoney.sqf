#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _money = param [1, 0, [0]];
private _leiche = param [2, objNull, [objNull]];
private _leicheUID = param [3, "", [""]];

private _isHacker = [[_leicheUID], _unit, remoteExecutedOwner, "fn_takeLootMoney"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _leiche) exitWith {};

private _index = MONEY_PICKUP findIf {_x select 0 == _leicheUID};

if(_index isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte aus einer Leiche %4 rausnehmen, es existiert allerdings gar keine Leiche", name _unit, getPlayerUID _unit, side _unit, _money];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "MoneyPickup Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein MoneyPickup Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _informationArray = MONEY_PICKUP select _index;
private _playerUID = _informationArray select 0;
private _playerName = _informationArray select 1;
private _playerItems = _informationArray select 2;
private _playerMoney = _informationArray select 3;
private _playerSide = _informationArray select 4;
_nearUnits = (nearestObjects[_unit, ["Man"], 15]) arrayIntersect playableUnits;

if(count _nearUnits > 1) exitWith {
private _otherPlayer = (_nearUnits select {_x != _unit}) select 0;
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte aus einer Leiche %4 (%5 - %6) %7 rausnehmen, es steht allerdings ein Spieler in seiner Naehe: %8 (%9 - %10)", name _unit, getPlayerUID _unit, side _unit, _playerName, _playerUID, _playerSide, _money, name _otherPlayer, getPlayerUID _otherPlayer, side _otherPlayer];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "MoneyPickup Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein MoneyPickup Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_money > _playerMoney) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte aus einer Leiche %4 (%5 - %6) %7 rausnehmen, die Leiche hat allerdings nicht soviel Geld", name _unit, getPlayerUID _unit, side _unit, _playerName, _playerUID, _playerSide, _money];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "MoneyPickup Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein MoneyPickup Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

_leiche setVariable ["Loot_Information", [_playerUID, _playerName, _playerItems, 0, _playerSide], true];
(MONEY_PICKUP select _index) set [3, 0];

if(_playerSide isEqualTo west && (side _unit) in [civilian, east]) then {
_msg = format ["Der Spieler %1 (%2 - %3) ist mit %4 auf der Hand gestorben und wurde von einem Zivilisten %5 (%6 - %7) gelootet", name _cop, getPlayerUID _cop, side _cop, [_money] call HC_fnc_numberSafe, name _unit, getPlayerUID _unit, side _unit];
["CopLog", _msg] call HC_fnc_Log;
};

[getPlayerUID _unit, side _unit, "cash", _money, true] call HC_fnc_handleMoney;
_msg = format ["Der Spieler %1 (%2 - %3) hat die Leiche des Spielers %4 (%5 - %6) gelootet und %7 bekommen", name _unit, getPlayerUID _unit, side _unit, _playerName, _playerUID, _playerSide, [_playerMoney] call HC_fnc_numberSafe];
["LootLog", _msg] call HC_fnc_Log;