private _unit = param [0, objNull, [objNull]];
private _weapon = param [1, "", [""]];

private _isHacker = [[_weapon], _unit, remoteExecutedOwner, "fn_weaponReloaded"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

sleep 0.3;

private _playerGear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, side _unit, _playerGear] call HC_fnc_handleInv;