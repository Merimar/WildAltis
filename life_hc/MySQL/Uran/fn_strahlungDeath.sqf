private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_strahlungDeath"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _msg = format ["Der Spieler %1 (%2 - %3) ist durch Strahlung gestorben", name _unit, getPlayerUID _unit, side _unit];
["DeathLog", _msg] call HC_fnc_Log;

_unit setDamage 1;