private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_butcherVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

if(side _unit != west) exitWith {
_reason1 = format["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug butchern, ist aber kein Polizist", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Vehicle Butcher Hack", [_reason1, _reason2], true] call HC_fnc_reportHacker;
[format ["Bei dem Spieler %1 wurde ein VehicleButcher Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _nearHemtts = nearestObjects [getPos _vehicle, ["B_Truck_01_box_F"], 30];
private _butcher = ({"hemtt_1.jpg" in (str (getObjectTextures _x))} count _nearHemtts) > 0;

if(!_butcher) exitWith {
_reason1 = format["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug butchern, es steht aber kein Butcher in der Nähe", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Vehicle Butcher Hack", [_reason1, _reason2], false] call HC_fnc_reportHacker;
[format ["Bei dem Spieler %1 wurde ein VehicleButcher Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

_vehicle setDamage 1;

private _vehiclePID = ((_vehicle getVariable ["vehicle_info_owners", []]) param [0, []]) param [0, "Keine PID"];
private _vehicleOwner = ((_vehicle getVariable ["vehicle_info_owners", []]) param [0, []]) param [1, "Kein Owner"];
private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug gebutchert (VEHICLE: %4 OWNER: %5 - %6)", name _unit, getPlayerUID _unit, side _unit, _vehicleName, _vehicleOwner, _vehiclePID];
["CopLog", _msg] call HC_fnc_Log;