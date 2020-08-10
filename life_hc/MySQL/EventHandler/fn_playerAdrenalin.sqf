#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _corpse = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_playerAdrenalin"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _corpse) exitWith {};

private _alive = [getPlayerUID _unit, side _unit, "alive"] call HC_fnc_getSpecialLevel;
if(_alive) then {
_reason1 = format ["Der Spieler %1 (%2 - %3) hat eine Adrenalinspritze benutzt, lebt aber laut server noch", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1 (%2 - %3)", name _unit, getPlayerUID _unit, side _unit];
[_unit, "Player Adrenalin Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
};

private _index = MONEY_PICKUP findIf {_x select 0 == getPlayerUID _unit};
if(_index isEqualTo -1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) hat eine Adrenalinspritze benutzt, aber seine Leiche konnte nicht im Server registiert werden, sein Geld und seine Items sind nun asynchron mit dem Server", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1 (%2 - %3)", name _unit, getPlayerUID _unit, side _unit];
[_unit, "Player Adrenalin Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
};

private _informationArray = MONEY_PICKUP deleteAt _index;
private _playerItems = _informationArray select 2;
private _playerMoney = _informationArray select 3;

_index = _unit getVariable ["notruf_index", -1];
if(_index != -1) then {
_informationArray = bank_obj getVariable ["Emergency_Calls", []];
_information = _informationArray select _index;
_information set [5, true];
bank_obj setVariable ["Emergency_Calls", _informationArray, true];
};

_unit setDir (getDir _corpse);
_unit setPosASL (visiblePositionASL _corpse);
_unit setDamage 0.95;

deleteVehicle _corpse;

["ReviveLog", format ["Der Spieler %1 (%2 - %3) hat eine Adrenalinspritze benutzt", name _unit, getPlayerUID _unit, side _unit]] call HC_fnc_log;

[getPlayerUID _unit, side _unit, "cash", _playerMoney, true] call HC_fnc_handleMoney;
[getPlayerUID _unit, side _unit, true] call HC_fnc_handleAlive;
{[getPlayerUID _unit, side _unit, (_x select 0), (_x select 1), true] call HC_fnc_handleVirt;}forEach _playerItems;
[getPlayerUID _unit, side _unit, "adrenalin", 1, false] call HC_fnc_handleVirt;

sleep 1;

private _gear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, side _unit, _gear] call HC_fnc_handleInv;