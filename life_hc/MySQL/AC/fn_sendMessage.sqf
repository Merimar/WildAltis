private _unit = param [0, objNull, [objNull]];
private _selection = param [1, 0, [0]];
private _message = param [2, "", [""]];
private _sendPosition = param [3, false, [false]];
private _target = param [4, objNull];
private _targetName = param [5, "", [""]];

private _isHacker = [[_message, _targetName], _unit, remoteExecutedOwner, "fn_sendMessage"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};
if(_sendPosition) then {_message = format ["%1<br/><br/>Position: %2", _message, mapGridPosition _unit];};

private _messageType = "";
private _messageToLog = "";
private _sender = "";

switch (_selection) do {
case 0 : {_messageType = "Nachricht"; _messageToLog = format["%1 (%2 - %3)", name _target, getPlayerUID _target, side _target]; _sender = name _unit;};
case 1 : {_messageType = "Polizeinotruf"; _messageToLog = "die Polizei"; _sender = name _unit;};
case 2 : {_messageType = "Feuerwehrnotruf"; _messageToLog = "die Feuerwehr"; _sender = name _unit;};
case 3 : {_messageType = "Gangnachricht"; _messageToLog = (group (_target select 0)) getVariable ["gang_name", ""]; _sender = name _unit;};
case 4 : {_messageType = "Adminnotruf"; _messageToLog = "die Admins"; _sender = name _unit;};
case 5 : {_messageType = "Polizeinachricht"; _messageToLog = "Alle"; _sender = "Polizei";};
case 6 : {_messageType = "Feuerwehrnachricht"; _messageToLog = "Alle"; _sender = "Feuerwehr";};
case 7 : {_messageType = "Gangeroberung Anküdigung"; _messageToLog = "Alle"; _sender = (group _unit) getVariable ["gang_name", ""]; _message = format ["%1 kündigt einen Angriff auf die Gangeroberung an!", _sender];};
case 8 : {_messageType = "Adminnachricht"; _messageToLog = "Alle"; _sender = "ADMIN";};
case 9 : {_messageType = "Adminnachricht"; _messageToLog = format["%1 (%2 - %3)", name _target, getPlayerUID _target, side _target]; _sender = "ADMIN";};
};

private _exit = false;

if(_selection isEqualTo 7) then {
private _gang = group _unit;
private _gangName = _gang getVariable ["gang_name", ""];
if(_gangName == "") exitWith {_exit = true; ["Du musst in einer Gang sein", "Ankündigung"] remoteExec ["life_fnc_message", _unit];};
if(_gang in ANMELDUNGEN || !ANMELDEN) exitWith {_exit = true; ["Du kannst dich erst 10 Minuten nach Restart anmelden", "Ankündigung"] remoteExec ["life_fnc_message", _unit];};
ANMELDUNGEN pushBack _gang;
[] remoteExec ["life_fnc_zonenTimer", units _gang];
_gang setVariable ["gangeroberung", true, true];
_target = playableUnits select {(group _x) in ANMELDUNGEN};
};

if(_exit) exitWith {};

[_selection, _message, _sender] remoteExecCall ["life_fnc_receiveMessage", _target];

private _log = format ["Der Spieler %1 (%2 - %3) hat eine/n %4 an %5 geschickt (NACHRICHT: %6)", name _unit, getPlayerUID _unit, side _unit, _messageType, _messageToLog, _message];
["MessageLog", _log] call HC_fnc_Log;