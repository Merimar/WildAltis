disableSerialization;
private _vehicles = param [0, []];
private _isServer = param [1, true];

if(_isServer) then {
if(VEHICLE_TYPE == "Air") then {GARAGE_AIR_VEHICLES = _vehicles;};
if(VEHICLE_TYPE == "Car") then {GARAGE_VEHICLES = _vehicles;};
if(VEHICLE_TYPE == "Ship") then {GARAGE_WATER_VEHICLES = _vehicles;};
}else {
if(VEHICLE_TYPE == "Air") then {_vehicles = GARAGE_AIR_VEHICLES;};
if(VEHICLE_TYPE == "Car") then {_vehicles = GARAGE_VEHICLES;};
if(VEHICLE_TYPE == "Ship") then {_vehicles = GARAGE_WATER_VEHICLES;};
};

if(isNull findDisplay 2800) exitWith {};

private _control = (findDisplay 2800) displayCtrl 2801;
lbClear _control;

{
private _id = _x select 0;
private _classname = _x select 1;

private _vehicleInfo = [_classname] call life_fnc_fetchVehInfo;
_control lbAdd (_vehicleInfo select 3);
_control lbSetData [(lbSize _control)-1, str _x];
_control lbSetPicture [(lbSize _control)-1, _vehicleInfo select 2];
_control lbSetValue [(lbSize _control)-1, _id];
}forEach _vehicles;