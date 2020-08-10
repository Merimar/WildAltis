private _vehicle = param [0, objNull, [objNull]];

private _dbInfo = _vehicle getVariable ["dbInfo", []];
private _vehicleSetup = _vehicle getVariable ["VehicleSetup", []];

if(count _dbInfo isEqualTo 0 || count _vehicleSetup isEqualTo 0) exitWith {deleteVehicle _vehicle;};

private _pID = _dbInfo select 0;
private _pSide = _dbInfo select 1;
private _vUID = _dbInfo select 2;
private _pSideID = [_pSide] call HC_fnc_getGroupSideID;
private _insurance = _vehicleSetup select 2;
private _nearPlayers = _vehicle nearEntities ["Man", 100];
private _pArray = [];
{_pArray pushback (format ["%1 (%2 - %3)", name _x, getPlayerUID _x, side _x]);}forEach _nearPlayers;
private _nearString = _pArray joinString ", ";

private _msg = format ["Ein Fahrzeug ist explodiert (OWNER: %1 OWNER_SIDE: %2 VEHICLE: %3 INSURANCE: %4), Folgende Leute haben sich in einer Reichweite von 100m zum Fahrzeug befunden: %5", _pID, _pSide, typeOf _vehicle, _insurance, _nearString];
["VehicleDestroyLog", _msg] call HC_fnc_Log;

if(!("'" in str _pID || "'" in str _pSide || "'" in str _vUID)) then {
private _query = if(_insurance) then {format["UPDATE vehicles SET insurance = '0', active = '0' WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3' AND deleted_at IS NULL", _pID, _pSideID, _vUID];}else {format["UPDATE vehicles SET active = '0', deleted_at = now() WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3' AND deleted_at IS NULL", _pID, _pSideID, _vUID];};
[_query, 1] call HC_fnc_asyncCall;
};

sleep 60;

if(!isNull _vehicle) then {deleteVehicle _vehicle;};