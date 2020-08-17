private _unit = param [0, objNull, [objNull]];
private _classname = param [1, "", [""]];

private _isHacker = [[_classname], _unit, remoteExecutedOwner, "fn_spawnVehicleMod", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _veh = _classname createVehicle (getPos _unit);
_veh lock false;
_veh setVehicleLock "UNLOCKED";

clearWeaponCargo _veh;
clearMagazineCargo _veh;

[_veh] call HC_fnc_clearVehicleAmmo;
_veh setVariable ["event_vehicle", true, true];

_veh addEventHandler ["Killed", "_veh = _this select 0; if(!(isNull _veh)) then {deleteVehicle _veh;};"];

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug gespawnt: %4", name _unit, getPlayerUID _unit, side _unit, _classname];
["AdminLog", _msg] call HC_fnc_Log;