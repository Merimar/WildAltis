private _unit = param [0, objNull, [objNull]];
private _result = param [1, [], [[]]];
private _hackList = bank_obj getVariable ["hack_list", []];

Merimar_fnc_terString = compileFinal "
_str = _this select 0;
_toFind = _this select 1;
_subsitution = _this select 2;
_char = count _toFind;
_no = _str find _toFind;
while {-1 != _str find _toFind} do {
_no = _str find _toFind;
_splitStr = _str splitString """";
_splitStr deleteRange [(_no +1), _char -1];
_splitStr set [_no, _subsitution];
_str = _splitStr joinString """";
};
_str;
";

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_logHackData"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _query = [];
private _pName = name _unit;
private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _geheimZahl = [_pID, _pSide] call HC_fnc_getGeheimzahl;

private _msg = format ["Bei dem Spieler %1 wurden modifizierte Arma 3 Dateien gefunden (", _pName];

{
private _display = _x select 0;
private _onLoad = _x select 1;
private _onUnload = _x select 2;
private _serverOnLoad = _x select 3;
private _serverOnUnload = _x select 4;

_msg = _msg + format ["%1,", _display];
private _object = [_pName, _display, _onLoad, _onUnload, _serverOnLoad, _serverOnUnload];
_hackList pushBack _object;

_onLoad = [_onLoad, "'", ""] call Merimar_fnc_terString;
_onUnload = [_onUnload, "'", ""] call Merimar_fnc_terString;

if(!("'" in _display) && !("'" in _onLoad) && !("'" in _onUnload)) then {
private _q = format["INSERT INTO hacking_log (name, player_id, on_load, on_unload) VALUES ('%1', '%2', '%3', '%4')", _display, _pID, _onLoad, _onUnload];
_query pushBack _q;
};
[format["Bei dem Spieler %1 wurden modifizierte Arma 3 Dateien gefunden: %2", _pName, _display], false] call HC_fnc_adminMessage;
sleep 0.5;
}forEach _result;

_msg = _msg + ")";
bank_obj setVariable ["hack_list", _hackList, true];

{[_x, 1] call HC_fnc_asyncCall;}forEach _query;

private _command = format ["#exec ban %1", _pName];
"tricksen" serverCommand _command;

if(!isNull _unit) then {[_geheimZahl] remoteExec ["life_fnc_getFucked", _unit];};