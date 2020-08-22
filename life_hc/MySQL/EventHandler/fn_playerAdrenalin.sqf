#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _corpse = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_playerAdrenalin"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _deathIndex = DEATH_ARRAY findIf {_x select 0 == (getPlayerUID _unit)};
if(_deathIndex isEqualTo -1) exitWith {};
private _deathArray = DEATH_ARRAY select _deathIndex;

private _realCorpse = if(isNull _corpse) then {_deathArray select 3} else {_corpse};

private _alive = [getPlayerUID _unit, "alive"] call HC_fnc_getSpecialLevel;
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

private _emergencies = bank_obj getVariable ["Emergency_Calls", []];
private _notrufIndex = _emergencies findIf {name _unit == _x select 0 && {_x select 8}};
if(_notrufIndex != -1) then {(_emergencies select _notrufIndex) set [5, true];bank_obj setVariable ["Emergency_Calls", _emergencies, true];};

private _deadPos = if(isNull _realCorpse) then {_deathArray select 4} else {visiblePositionASL _realCorpse};
private _deadDir = if(isNull _realCorpse) then {_deathArray select 5} else {getDir _realCorpse};

_unit setDir _deadDir;
_unit setPosASL _deadPos;
_unit setDamage 0.95;

deleteVehicle _realCorpse;

["ReviveLog", format ["Der Spieler %1 (%2 - %3) hat eine EpiPen benutzt", name _unit, getPlayerUID _unit, side _unit]] call HC_fnc_log;

[getPlayerUID _unit, "cash", _playerMoney, true] call HC_fnc_handleMoney;
[getPlayerUID _unit, true] call HC_fnc_handleAlive;
{[getPlayerUID _unit, (_x select 0), (_x select 1), true] call HC_fnc_handleVirt;}forEach _playerItems;
[getPlayerUID _unit, "adrenalin", 1, false] call HC_fnc_handleVirt;

sleep 1;

private _gear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, _gear] call HC_fnc_handleInv;