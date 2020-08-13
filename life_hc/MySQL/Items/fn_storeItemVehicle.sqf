#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _amount = param [2, 0, [0]];
private _vehicle = param [3, objNull, [objNull]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_storeItemVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker || isNull _vehicle) exitWith {};

private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");
private _pItems = [getPlayerUID _unit, _item] call HC_fnc_countVirt;

if(_pItems < _amount) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) in ein Fahrzeug legen, hat aber nicht genug Items (%5 < %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, _pItems, _amount];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Store Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Store Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

[getPlayerUID _unit, _item, _amount, false] call HC_fnc_handleVirt;
[_vehicle, _item, _amount, true] call HC_fnc_handleVehicleInv;

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Item in ein Fahrzeug gelegt (ITEM: %4 AMOUNT: %5 FAHRZEUG: %6)", name _unit, getPlayerUID _unit, side _unit, _displayName, _amount, typeOf _vehicle];
["VehicleStoreLog", _msg] call HC_fnc_Log;

