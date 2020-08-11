#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _item = param [1, "", [""]];
private _extraInfo = param [2, [], [[]]];

private _isHacker = [[_item], _unit, remoteExecutedOwner, "fn_useItem"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _displayName = getText (missionConfigFile >> "Items" >> _item >> "name");

if(_item == "spikeStrip" && count _extraInfo > 0) exitWith {
[getPlayerUID _unit, side _unit, _item, 1, true] call HC_fnc_handleVirt;
_msg = format ["Der Spieler %1 (%2 - %3) hat ein Item aufgehoben (%4)", name _unit, getPlayerUID _unit, side _unit, _displayName];
["UseLog", _msg] call HC_fnc_Log;
};

private _pItems = [getPlayerUID _unit, side _unit, _item] call HC_fnc_countVirt;

if(_pItems < 1) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Item (%4) benutzen, hat aber nicht genug Items (%5 < 1)", name _unit, getPlayerUID _unit, side _unit, _displayName, [_pItems] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Item Use Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Item Use Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(_item == "lockpick") exitWith {
private _obj = _extraInfo select 0;
private _success = _extraInfo select 1;
private _objSide = (_obj getVariable ["dbInfo", ["", sideUnknown, 0]]) select 1;
_msg = format ["Der Spieler %1 (%2 - %3) hat einen Dietrich benutzt (OBJEKT: %4 GESCHAFFT: %5)", name _unit, getPlayerUID _unit, side _unit, typeOf _obj, _success];
["UseLog", _msg] call HC_fnc_Log;
[getPlayerUID _unit, side _unit, "lockpick"] call HC_fnc_addSkill;
if((_obj isKindOf "LandVehicle" || _obj isKindOf "Ship" || _obj isKindOf "Air") && _success) then {[getPlayerUID _unit, side _unit, _obj, 1] call HC_fnc_keyManagement;};
if((side _unit) isEqualTo independent) exitWith {};
[getPlayerUID _unit, side _unit, _item, 1, false] call HC_fnc_handleVirt;
if(_success) then {
if(_objSide isEqualTo west) then {
[_unit, "VEHICLE_STEAL_COP"] call HC_fnc_fahndungHandle;
}else {
[_unit, "VEHICLE_STEAL"] call HC_fnc_fahndungHandle;
};
}else {
if(_objSide isEqualTo west) then {
[_unit, "VEHICLE_STEAL_TRY_COP"] call HC_fnc_fahndungHandle;
}else {
[_unit, "VEHICLE_STEAL_TRY"] call HC_fnc_fahndungHandle;
};
};
};

[getPlayerUID _unit, side _unit, _item, 1, false] call HC_fnc_handleVirt;

if(_item == "fuelEmpty") then {
[getPlayerUID _unit, side _unit, "fuelFull", 1, true] call HC_fnc_handleVirt;
[getPlayerUID _unit, side _unit, "cash", 10000, false] call HC_fnc_handleMoney;
};

if(_item == "fuelFull") then {
[getPlayerUID _unit, side _unit, "fuelEmpty", 1, true] call HC_fnc_handleVirt;
};

if(_item == "schloss") then {
private _zelle = _extraInfo param [0, objNull, [objNull]];
_zelle setVariable ["bis_disabled_Door_1", 1, true];
[_zelle, "bis_disabled_Door_1", 0, west] remoteExec ["life_fnc_setVariable", west];
};

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Item benutzt (%4)", name _unit, getPlayerUID _unit, side _unit, _displayName];
["UseLog", _msg] call HC_fnc_Log;