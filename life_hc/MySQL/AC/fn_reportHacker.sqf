private _unit = _this select 0;
private _reason = _this select 1;
private _info = _this select 2;
private _autoBan = _this select 3;
private _hackList = bank_obj getVariable ["hack_list", []];

private _query = format["INSERT INTO hacking_log (name, player_id, on_load, on_unload) VALUES ('%1', '%2', '%3', '%4')", _reason, getPlayerUID _unit, _info select 0, _info select 1];
[_query ,1] call HC_fnc_asyncCall;

private _geheimZahl = [getPlayerUID _unit] call HC_fnc_getGeheimzahl;

private _object = [name _unit, getPlayerUID _unit, _reason, _info select 0, _info select 1, ""];
_hackList pushBack _object;
bank_obj setVariable ["hack_list", _hackList, true];

private _name = name _unit;

if(!_autoBan) exitWith {};

_command = format ["#exec ban %1", _name];
"tricksen" serverCommand _command;

[_geheimZahl] remoteExec ["life_fnc_getFucked", _unit];