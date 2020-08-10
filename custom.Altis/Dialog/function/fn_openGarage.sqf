private _vehType = _this select 0;
private _spawnPoint = _this select 1;

VEHICLE_SPAWNPOINT = _spawnPoint;
VEHICLE_TYPE = _vehType;
createDialog "Garage";  
disableSerialization;

private _display = findDisplay 2800;
private _list = _display displayCtrl 2801;
private _buyBtn = _display displayCtrl 2803;
private _updateBtn = _display displayCtrl 2805;
private _header = _display displayCtrl 2806;

_header ctrlSetText "Garage";
_list ctrlSetEventHandler ["LBSelChanged", "[] call life_fnc_garageLBChange"];
_buyBtn buttonSetAction "[] call life_fnc_unimpound";
_updateBtn buttonSetAction "[] call life_fnc_updateGarage";

if(!GARAGE_TIMER) then {
[_vehType] call life_fnc_updateGarage;
}else {
[[], false] call life_fnc_getUpdateGarage;
};