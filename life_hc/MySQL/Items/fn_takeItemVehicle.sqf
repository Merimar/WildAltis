#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _amount = param [2, 0, [0]];
private _vehicle = param [3, objNull, [objNull]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_takeItemVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");
private _vehicleAmount = [_vehicle, _item] call HC_fnc_getVehicleItems;

if(_vehicleAmount < _amount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) aus einem Fahrzeug nehmen, das Fahrzeug hat aber nicht genug Items (%5 < %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, _vehicleAmount, _amount];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Take Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Take Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[_vehicle, _item, _amount, false] call HC_fnc_handleVehicleInv;
[getPlayerUID _unit, _item, _amount, true] call HC_fnc_handleVirt;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Item aus einem Fahrzeug genommen (ITEM: %4 AMOUNT: %5 FAHRZEUG: %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, _amount, typeOf _vehicle];
["VehicleTakeLog", _msg] call HC_fnc_Log;