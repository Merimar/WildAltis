#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _corpse = param [1, objNull, [objNull]];
private _medic = param [2, objNull, [objNull]];
private _isDefi = param [3, false, [false]];
private _fee = 10000;

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_playerRevived"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _corpse || isNull _medic) exitWith {};

private _alive = [getPlayerUID _unit, "alive"] call HC_fnc_getSpecialLevel;
if(_alive) then {
_reason1 = format ["Der Spieler %1 (%2 - %3) wurde revived, lebt aber laut server noch", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1 (%2 - %3)", name _unit, getPlayerUID _unit, side _unit];
[_unit, "Player Revive Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
};

private _index = MONEY_PICKUP findIf {_x select 0 == getPlayerUID _unit};
if(_index isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wurde von %4 (%5 - %6) wiederbelebt, aber seine Leiche konnte nicht im Server registiert werden, sein Geld und seine Items sind nun asynchron mit dem Server", name _unit, getPlayerUID _unit, side _unit, name _medic, getPlayerUID _medic, side _medic];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1 (%2)", name _unit, getPlayerUID _unit];
[_unit, "Player Revive Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
};

private _informationArray = MONEY_PICKUP deleteAt _index;
private _playerUID = _informationArray select 0;
private _playerName = _informationArray select 1;
private _playerItems = _informationArray select 2;
private _playerMoney = _informationArray select 3;
private _playerSide = _informationArray select 4;

_index = _unit getVariable ["notruf_index", -1];
if(_index != -1) then {
_informationArray = bank_obj getVariable ["Emergency_Calls", []];
_information = _informationArray select _index;
_information set [5, true];
bank_obj setVariable ["Emergency_Calls", _informationArray, true];
};

_unit setDir (getDir _corpse);
_unit setPosASL (visiblePositionASL _corpse);
_unit setDamage 0.99;

deleteVehicle _corpse;

[getPlayerUID _medic, "revive"] call HC_fnc_addSkill;
[getPlayerUID _unit, "cash", _playerMoney, true] call HC_fnc_handleMoney;
[getPlayerUID _unit, true] call HC_fnc_handleAlive;
{[getPlayerUID _unit, (_x select 0), (_x select 1), true] call HC_fnc_handleVirt;}forEach _playerItems;
private _bankMoney = [getPlayerUID _unit, "bank"] call HC_fnc_getMoney;

["ReviveLog", format ["Der Spieler %1 (%2 - %3) wurde von dem Spieler %4 (%5 - %6) wiederbelebt", name _unit, getPlayerUID _unit, side _unit, name _medic, getPlayerUID _medic, side _medic]] call HC_fnc_log;

if(!_isDefi) then {
[getPlayerUID _medic, "bank", _fee * 5, true] call HC_fnc_handleMoney;
["MoneyLog", format ["Dem Spieler %1 (%2 - %3) wurden durch Wiederbelebung %4 Dollar hinzugefuegt", name _medic, getPlayerUID _medic, side _medic, [_fee * 5] call HC_fnc_numberSafe]] call HC_fnc_log;
if(_bankMoney >= _fee) then {
[getPlayerUID _unit, "bank", _fee, false] call HC_fnc_handleMoney;
["MoneyLog", format ["Dem Spieler %1 (%2 - %3) wurden durch Wiederbelebung %4 Dollar abgezogen", name _unit, getPlayerUID _unit, side _unit, [_fee] call HC_fnc_numberSafe]] call HC_fnc_log;
};
};

sleep 1;

private _gear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, _gear] call HC_fnc_handleInv;