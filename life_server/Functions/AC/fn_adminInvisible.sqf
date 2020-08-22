private _unit = param [0, objNull, [objNull]];
//private _start = param [1, true, [true]];

//if(remoteExecutedOwner in [HC_LIFE, 0]) exitWith {_unit hideObjectGlobal _start;};

if(isNull _unit) exitWith {};
if(remoteExecutedOwner != owner _unit) exitWith {};

private _query = format ["SELECT level FROM player_level WHERE level_id = '1' AND player_id = '%1'", getPlayerUID _unit];
private _queryResult = [_query, 2] call DB_fnc_asyncCall;
if(count _queryResult <= 0) exitWith {};
private _lvl = _queryResult select 0;
if(_lvl < 1) exitWith {};

private _unsichtbar = _unit getVariable ["invisible", false];
_unit setVariable ["invisible", !_unsichtbar, true];
_unit hideObjectGlobal !_unsichtbar;