private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_dupeHC"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _gear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, side _unit, _gear] call HC_fnc_handleInv;

_msg = format ["Der Spieler %1 (%2 - %3) hat ein Item gedupet: %4", name _unit, getPlayerUID _unit, side _unit, _item];
["DupeLog", _msg] call HC_fnc_Log;

[format ["Bei dem Spieler %1 wurde ein Westen Dupe festgestellt", name _unit], false] call HC_fnc_adminMessage;

private _hackList = bank_obj getVariable ["hack_list", []];
_hackList pushBack ["Duping Log", "Der Spieler wurde bei einem Dupe detected", name _unit, getPlayerUID _unit, side _unit, _item];
bank_obj setVariable ["hack_list", _hackList, true];