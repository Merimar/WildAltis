#include "..\script_macros.hpp"
disableSerialization;
if(isNull findDisplay 140000) then {createDialog "life_eventvehicle_menu";};

_display = findDisplay 140000;
_lList = _display displayCtrl 140002;
_wList = _display displayCtrl 140003;
_aList = _display displayCtrl 140004;
lbClear _lList;
lbClear _wList;
lbClear _aList;

private _cars = "getText (_x >> 'vehicleClass') in ['Car', 'Support', 'Tank']" configClasses (configfile >> "CfgVehicles");
private _ships = "getText (_x >> 'vehicleClass') == 'Ship'" configClasses (configfile >> "CfgVehicles");
private _helis = "getText (_x >> 'vehicleClass') == 'Air'" configClasses (configfile >> "CfgVehicles");

{
private _vehicles = _x select 0;
private _list = _x select 1;
{
private _displayName = getText (_x >> "displayName");
private _picture = getText (_x >> "picture");
private _genMacro = getText (_x >> "_generalMacro");
if(_displayName != "" && _picture != "" && (_genMacro == configName _x) && !("base" in (configName _x))) then {
_list lbAdd _displayName;
_list lbSetData [(lbSize _list) - 1, configName _x];
_list lbSetPicture [(lbSize _list) - 1, _picture];
};
}forEach _vehicles;
}forEach [[_cars, _lList], [_ships, _wList], [_helis, _aList]];