private _unit = param [0, objNull, [objNull]];
private _nearVehicles = nearestObjects [_unit, ["Car", "Air", "Ship", "Tank"], 10];

{
private _dbInfo = _x getVariable["dbInfo", []];
if(count _dbInfo > 0) then {
private _pID = _dbInfo select 0;
private _pSide = _dbInfo select 1;
private _vUID = _dbInfo select 2;
private _sideID = [_pSide] call HC_fnc_getSideID;

private _isHacker = [[_pID, _pSide, _vUID], _unit, remoteExecutedOwner, "fn_adminImpound", true] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _query = format["UPDATE vehicles SET active = '0' WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3' AND deleted_at IS NULL", _pID, _sideID, _vUID];
[_query, 1] call HC_fnc_asyncCall;
};

deleteVehicle _x;
}foreach _nearVehicles;

["AdminLog", format["Der Spieler %1 (%2 - %3) hat %4 Fahrzeuge beschlagnahmt", name _unit, getPlayerUID _unit, side _unit, count _nearVehicles]] call HC_fnc_Log;