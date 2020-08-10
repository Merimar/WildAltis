#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_vehicleStore"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _pSideID = [_pSide] call HC_fnc_getGroupSideID;

private _dbInfo = _vehicle getVariable ["dbInfo", []];
if(count _dbInfo <= 0) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug einparken, das Fahrzeug hat aber kein dbInfo", name _unit, getPlayerUID _unit, side _unit];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "VehicleStore Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VehicleStore Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _pVehicleID = _dbInfo select 0;
private _pVehicleSide = _dbInfo select 1;
private _vUID = _dbInfo select 2;

if(_pSide != _pVehicleSide || "'" in (str _pVehicleSide) || "'" in (str _pVehicleID) || "'" in (str _vUID)) exitWith {};

if(_pVehicleID != _pID) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug einparken, das Fahrzeug gehört aber einem anderen Spieler (%4 != %5)", name _unit, getPlayerUID _unit, side _unit, _pID, _pVehicleID];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "VehicleStore Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VehicleStore Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

["Dein Fahrzeug wurde eingeparkt. Du kannst es nun wieder in deiner Garage finden", "Eingeparkt"] remoteExec ["life_fnc_message", _unit];

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug eingeparkt (FAHRZEUG: %4 POSITION: %5)", name _unit, getPlayerUID _unit, side _unit, typeOf _vehicle, mapGridPosition _unit];
["VehicleStoreLog", _msg] call HC_fnc_Log;

private _query = format ["UPDATE vehicles SET active = '0' WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3' AND deleted_at IS NULL", _pID, _pSideID, _vUID];
[_query, 1] call HC_fnc_asyncCall;

if(!isNull _vehicle) then {deleteVehicle _vehicle;};