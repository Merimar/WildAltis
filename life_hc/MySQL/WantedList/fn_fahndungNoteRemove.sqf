private _unit = param [0, objNull, [objNull]];
private _criminalID = param [1, "", [""]];
private _messageID = param [2, -1, [0]];

private _isHacker = [[_criminalID], _unit, remoteExecutedOwner, "fn_fahndungNoteRemove"] call HC_fnc_checkSQLBreak;
if(_isHacker || _messageID isEqualTo -1) exitWith {};

private _crimeIndex = CRIME_LIST findIf {_x select 1 == _criminalID};
if(_crimeIndex isEqualTo -1) exitWith {};

private _criminalName = CRIME_LIST select _crimeIndex select 0;
private _criminalSide = CRIME_LIST select _crimeIndex select 2;
private _messages = CRIME_LIST select _crimeIndex select 7;
private _messageIndex = _messages findIf {(_x select 4) isEqualTo _messageID};
if(_messageIndex isEqualTo -1) exitWith {};

private _prevMessage = _messages select _messageIndex select 3;
_messages deleteAt _messageIndex;

private _msg = format ["Der Spieler %1 (%2 - %3) hat bei dem Spieler %4 (%5 - %6) eine Notiz gelöscht (NOTIZ: %7)", name _unit, getPlayerUID _unit, side _unit, _criminalName, _criminalID, _criminalSide, _prevMessage];
["NotizLog", _msg] call HC_fnc_Log;