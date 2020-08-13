private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_staminaUpdate"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

[getPlayerUID _unit, "stamina"] call HC_fnc_addSkill;

private _msg = format ["Der Spieler %1 (%2 - %3) hat seine Ausdauer gesteigert", name _unit, getPlayerUID _unit, side _unit];
["AusdauerLog", _msg] call HC_fnc_Log;