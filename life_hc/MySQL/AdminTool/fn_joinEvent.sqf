private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_joinEvent"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pos = bank_obj getVariable ["Scroll_Pos", [0, 0, 0]];
_unit setPos _pos;