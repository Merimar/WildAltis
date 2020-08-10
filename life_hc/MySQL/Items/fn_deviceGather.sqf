private _unit = param [0, objNull, [objNull]];
private _vehicle = param [1, objNull, [objNull]];
private _item = param [2, "", [""]];
private _amount = param [3, 0, [0]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_deviceGather"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle || {!(typeOf _vehicle in ["O_Truck_03_device_F", "O_T_Truck_03_device_ghex_F"])}) exitWith {};

[_vehicle, _item, _amount, true] call HC_fnc_handleVehicleInv;

private _itemName = getText (missionConfigFile >> "Items" >> _item >> "name");
private _msg = format ["Der Spieler %1 (%2 - %3) hat mit einem %4 %5 %6 gefarmt", name _unit, getPlayerUID _unit, side _unit, typeOf _vehicle, _amount, _itemName];
["VehicleGatherLog", _msg] call HC_fnc_Log;