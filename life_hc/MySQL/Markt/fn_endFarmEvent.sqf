private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_endFarmEvent", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _eventIndex = MARKT_ARRAY findIf {(_x select 6) != -1};
if(_eventIndex isEqualTo -1) exitWith {};

private _msg = format ["Der Admin %1 (%2 - %3) hat das Markt Event beendet", name _unit, getPlayerUID _unit, side _unit];
["MarktLog", _msg] call HC_fnc_Log;

CANCEL_EVENT = true;