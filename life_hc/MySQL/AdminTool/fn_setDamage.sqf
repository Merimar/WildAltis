private _unit = param [0, objNull, [objNull]];
private _damageObj = param [1, objNull, [objNull]];
private _amount = param [2, 0, [0]];
private _cause = param [3, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_setDamage", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _msg = switch (_cause) do {
case 0 : {format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) geheilt!", name _unit, getPlayerUID _unit, side _unit, name _damageObj, getPlayerUID _damageObj, side _damageObj]};
case 1 : {format ["Der Spieler %1 (%2 - %3) hat den Spieler %4 (%5 - %6) gekillt!", name _unit, getPlayerUID _unit, side _unit, name _damageObj, getPlayerUID _damageObj, side _damageObj]};
case 2 : {format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug repariert", name _unit, getPlayerUID _unit, side _unit]};
};

private _alive = if(_cause != 2) then {[getPlayerUID _damageObj, side _damageObj, "alive"] call HC_fnc_getSpecialLevel} else {true};
if(_amount >= 1 && !_alive) exitWith {};

_damageObj setDamage _amount;
["AdminLog", _msg] call HC_fnc_Log;