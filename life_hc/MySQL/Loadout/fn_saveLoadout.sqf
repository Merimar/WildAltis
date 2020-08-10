private _unit = param [0, objNull, [objNull]];
private _gear = param [1, [], [[]]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_saveLoadout"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _curSel = _gear select 1;
private _pSide = side _unit;
private _pID = getPlayerUID _unit;

[_pID, _pSide, _gear, _curSel] call HC_fnc_addLoadout;

_msg = format ["Der Spieler %1 (%2 - %3) hat ein Loadout gespeichert: %4", name _unit, getPlayerUID _unit, side _unit, _gear];
["LoadoutLog", _msg] call HC_fnc_Log;