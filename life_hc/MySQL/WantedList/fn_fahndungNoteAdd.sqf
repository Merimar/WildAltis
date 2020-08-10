private _unit = param [0, objNull, [objNull]];
private _text = param [1, "", [""]];
private _criminalID = param [2, "", [""]];
private _messageID = param [3, -1, [0]];

private _isHacker = [[_text], _unit, remoteExecutedOwner, "fn_fahndungNoteAdd"] call HC_fnc_checkSQLBreak;
if(_isHacker || _text == "" || _messageID isEqualTo -1) exitWith {};

private _crimeIndex = CRIME_LIST findIf {_x select 1 == _criminalID};
if(_crimeIndex isEqualTo -1) exitWith {};

private _messages = CRIME_LIST select _crimeIndex select 7;
_messages pushBack [getPlayerUID _unit, name _unit, "#1E8FBA", _text, _messageID];

private _criminalName = CRIME_LIST select _crimeIndex select 0;
private _criminalSide = CRIME_LIST select _crimeIndex select 2;

private _msg = format ["Der Spieler %1 (%2 - %3) hat dem Spieler %4 (%5 - %6) eine Notiz hinzugefügt (NOTIZ: %7)", name _unit, getPlayerUID _unit, side _unit, _criminalName, _criminalID, _criminalSide, _text];
["NotizLog", _msg] call HC_fnc_Log;