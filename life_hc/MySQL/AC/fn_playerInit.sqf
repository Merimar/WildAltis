private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_playerInit"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _unit) exitWith {};

private _pName = name _unit;
private _pID = getPlayerUID _unit;

private _query = format["SELECT amount FROM hackLog WHERE name='%1'", _pName];
private _queryResult = [_query, 2] call HC_fnc_asyncCall;

if(count _queryResult isEqualTo 0) then {
_query = format["INSERT INTO hackLog (name, amount, player_id) VALUES ('%1', '1', '%2')", _pName, _pID];
[_query, 1] call HC_fnc_asyncCall;
}else {
private _amount = (_queryResult param [0, 1]) + 1;
_query = format["UPDATE hackLog SET amount='%1' WHERE name='%2'", _amount, _pName];
[_query, 1] call HC_fnc_asyncCall;
};