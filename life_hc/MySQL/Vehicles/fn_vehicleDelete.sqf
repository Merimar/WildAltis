#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _vUID = param [1, 0, [0]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_vehicleDelete"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _pSideID = [_pSide] call HC_fnc_getGroupSideID;
private _databaseInformation = [_vUID, _pID, _pSide] call HC_fnc_getVehicleDatabase;
if(count _databaseInformation isEqualTo 0) exitWith {};
private _classname = _databaseInformation select 1;
private _active = _databaseInformation select 3;
private _impounded = _databaseInformation select 7;

if(_active isEqualTo 1) exitWith {};
if(_impounded isEqualTo 1) exitWith {};

private _sellPrice = [_classname, side _unit] call HC_fnc_getVehicleSellPrice;

private _query = format ["UPDATE vehicles SET deleted_at = now(), insurance = '0' WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3' AND deleted_at IS NULL", _pID, _pSideID, _vUID];
[_query, 1] call HC_fnc_asyncCall;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug verkauft (FAHRZEUG: %4 PREIS: $%5)", name _unit, _pID, _pSide, _classname, [_sellPrice] call HC_fnc_numberSafe];
["VehicleSellLog", _msg] call HC_fnc_Log;

[_pID, _pSide, "bank", _sellPrice, true] call HC_fnc_handleMoney;