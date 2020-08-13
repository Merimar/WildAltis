private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_boltZenti"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

[getPlayerUID _unit, "boltcutter"] call HC_fnc_addSkill;

[format ["%1 hat eine Zenti geknackt", name _unit], true] call HC_fnc_adminMessage;
private _msg = format ["Der Spieler %1 (%2 - %3) hat die Zentralbank geknackt", name _unit, getPlayerUID _unit, side _unit];
["BankLog", _msg] call HC_fnc_Log;

["Die Zentralbank wurde geknackt", "Zentralbank"] remoteExec ["life_fnc_message", west];