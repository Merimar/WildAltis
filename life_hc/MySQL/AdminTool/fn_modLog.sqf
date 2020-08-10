private _unit = param [0, objNull, [objNull]];
private _message = param [1, "", [""]];
private _adminMessage = param [2, "", [""]];

private _isHacker = [[_message, _adminMessage], _unit, remoteExecutedOwner, "fn_modLog", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

["AdminLog", _message] call HC_fnc_Log;

if(_adminMessage != "") then  {[_adminMessage, true] call HC_fnc_adminMessage;};