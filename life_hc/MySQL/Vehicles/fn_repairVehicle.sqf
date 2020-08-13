private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_repairVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

if(!(side _unit isEqualTo independent)) then {
_gear = [_unit] call HC_fnc_getPlayerGear;
[getPlayerUID _unit, _gear] call HC_fnc_handleInv;
};

[getPlayerUID _unit, "repair"] call HC_fnc_addSkill;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug repariert (FAHRZEUG: %4 POSITION: %5)", name _unit, getPlayerUID _unit, side _unit, typeOf _vehicle, getPos _unit];
["RepairLog", _msg] call HC_fnc_Log;

_vehicle setDamage 0;