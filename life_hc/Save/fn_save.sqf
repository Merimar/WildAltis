private _unit = param [0, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_save"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _saveArrayIndex = [getPlayerUID _unit, side _unit] call HC_fnc_searchArray;
if(_saveArrayIndex isEqualTo -1) exitWith {};
if(count (SAVE_ARRAY select _saveArrayIndex select SAVE_STATE_INDEX) isEqualTo 0) exitWith {};

[_saveArrayIndex] call HC_fnc_saveToDatabase;