private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_flipVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

_vehicle setPos [(getPos _vehicle) select 0, (getPos _vehicle) select 1, ((getPos _vehicle) select 2) + 1.5];

private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug geflipt (VEHICLE: %4)", name _unit, getPlayerUID _unit, side _unit, _vehicleName];
["FlipLog", _msg] call HC_fnc_Log;