private _unit = param [0, objNull, [objNull]];
private _reason = param [1, "", [""]];

private _isHacker = [[_reason], _unit, remoteExecutedOwner, "fn_survivalHC"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _msg = format ["Der Spieler %1 (%2 - %3) ist durch %4 gestorben", name _unit, getPlayerUID _unit, side _unit, _reason];
["DeathLog", _msg] call HC_fnc_Log;

_unit setDamage 1;