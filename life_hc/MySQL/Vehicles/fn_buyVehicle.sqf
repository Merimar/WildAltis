#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _vehicleClassname = param [1, "", [""]];
private _skinClassname = param [2, "", [""]];
private _materialClassname = param [3, "", [""]];
private _insuranceClassname = param [4, false, [false]];
private _action = param [5, true, [false]];
private _endPrice = param [6, 0, [0]];
private _shop = param [7, [], [[]]];

private _isHacker = [[_vehicleClassname, _skinClassname, _materialClassname], _unit, remoteExecutedOwner, "fn_buyVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _unitOwner = [_pID] call HC_fnc_getOwnerID;
private _vehiclePrice = getNumber (missionConfigFile >> "LifeCfgVehicles" >> _vehicleClassname >> "price");
private _skinPrice = if(_skinClassname != "-1") then {getNumber(missionConfigFile >> "LifeCfgVehicles" >> _vehicleClassname >> "textures" >> _skinClassname >> "price")} else {1};
private _materialPrice = if(_materialClassname != "-1") then {getNumber(missionConfigFile >> "LifeCfgMaterials" >> _materialClassname >> "price")} else {1};
private _insurancePrice = if(_insuranceClassname) then {1.7} else {1.0};
private _nameVehicle = getText (configFile >> "CfgVehicles" >> _vehicleClassname >> "displayName");
private _setUp = [_skinClassname, _materialClassname, _insuranceClassname];
private _buyMultiplier = switch (_pSide) do {case civilian : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_CIVILIAN")};case east : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_OPFOR")};case west : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_COP")};case independent : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_purchase_multiplier_MEDIC")};};
private _rentMultiplier = switch (_pSide) do {case civilian : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_CIVILIAN")};case east : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_OPFOR")};case west : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_COP")};case independent : {getNumber (missionConfigFile >> "Life_Settings" >> "vehicle_rental_multiplier_MEDIC")};};
private _multiplier = if(_action) then {_buyMultiplier} else {_rentMultiplier};
private _price = round (_vehiclePrice * _skinPrice * _materialPrice * _insurancePrice * _multiplier);

if(_price != _endPrice) exitWith {
_reason1 = format["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug kaufen, hat aber einen anderen Preis angegeben (%4 != %5)", name _unit, getPlayerUID _unit, side _unit, [_endPrice] call HC_fnc_numberSafe, [_price] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Vehicle Buy Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VehicleBuy Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
vehicle_money = false;
_unitOwner publicVariableClient "vehicle_money";
};

private _cash = [_pID, "cash"] call HC_fnc_getMoney;

if(_price > _cash) exitWith {
_reason1 = format["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug kaufen, hat aber nicht genug Geld (%4 < %5)", name _unit, getPlayerUID _unit, side _unit, [_cash] call HC_fnc_numberSafe, [_price] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "Vehicle Buy Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VehicleBuy Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
vehicle_money = false;
_unitOwner publicVariableClient "vehicle_money";
};

private _sp = _shop select 2;
private _sp = if(_sp isEqualType []) then {_sp select {count (nearestObjects[getMarkerPos _x,["Car","Air","Ship"],10]) isEqualTo 0}} else {[_sp] select {count (nearestObjects[getMarkerPos _x,["Car","Air","Ship"],10]) isEqualTo 0}};

if(count _sp isEqualTo 0) exitWith {
["Es steht bereits ein Fahrzeug auf dem Spawnpunkt", "Kein Spawnpunkt"] remoteExec ["life_fnc_message", _unitOwner];
vehicle_money = false;
_unitOwner publicVariableClient "vehicle_money";
};

private _spawnPoint = getMarkerPos (_sp select 0);
private _notPos = false;

if((_sp select 0) == "Spawn_Air_FW_2") then {_spawnPoint set [2, 20];};
if((_sp select 0) == "Spawn_Aircraft") then {_spawnPoint set [2, 24]; _notPos = true;};

private _vehicle = createVehicle [_vehicleClassname, _spawnPoint, [], 0, "NONE"];
waitUntil {!isNull _vehicle};

private _aiDrones = getArray (missionConfigFile >> "Life_Settings" >> "drones");
if(_vehicleClassname in _aiDrones) then {createVehicleCrew _vehicle;};

_vehicle allowDamage false;
if(_notPos) then {_vehicle setPosASL _spawnPoint;} else {_vehicle setPos _spawnPoint;};
_vehicle setVectorUp (surfaceNormal _spawnPoint);
_vehicle setDir (markerDir (_sp select 0));
_vehicle lock 2;
_vehicle setVariable ["VehicleSetup", _setUp, true];
_vehicle setVariable ["trunk_in_use", false, true];
_vehicle setVariable ["vehicle_info_owners", [[_pID, name _unit]], true];
_vehicle enableRopeAttach false;
clearWeaponCargo _vehicle;
clearMagazineCargo _vehicle;

if(_vehicleClassname in _aiDrones) then {_vehicle lock 0;};

if(_vehicleClassname == "O_APC_Wheeled_02_rcws_F" && _pSide isEqualTo west) then {
_vehicle animate ["showslathull", 1];
};

[_vehicle] call HC_fnc_addExplosionEH;
//[_vehicle] remoteExec ["TON_fnc_localEH", 2];
[_pID, _pSide, _vehicle, 1] call HC_fnc_keyManagement;
[_vehicle, _skinClassname, _materialClassname] call HC_fnc_colorVehicle;
[_vehicle, _pSide isEqualTo independent] call HC_fnc_clearVehicleAmmo;

VEHICLE_LIST pushBack _vehicle;

[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain", _unitOwner];
[getPlayerUID _unit, "cash", _price, false] call HC_fnc_handleMoney;
vehicle_money = true;
_unitOwner publicVariableClient "vehicle_money";

if(_action) then {
[_pID, _pSide, _vehicle, _skinClassname, _materialClassname, _insuranceClassname] call HC_fnc_insertVehicle;
[format["Du hast dir ein %1 für $%2 gekauft", _nameVehicle, [_price] call life_fnc_numberText], "Fahrzeug gekauft"] remoteExec ["life_fnc_message",_unitOwner];
_msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug gekauft (FAHRZEUG: %4 PREIS: %5 SHOP: %6 SETUP: %7)", name _unit, getPlayerUID _unit, side _unit, typeOf _vehicle, [_price] call HC_fnc_numberSafe, _shop select 0, str _setUp];
["VehiceBuyLog", _msg] call HC_fnc_Log;
}else {
_vehicle setVariable ["rent", true, true];
[format["Du hast dir ein %1 %2$ gemietet", _nameVehicle, [_price] call life_fnc_numberText], "Fahrzeug gemietet"] remoteExec ["life_fnc_message",_unitOwner];
_msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug gemietet (FAHRZEUG: %4 PREIS: %5 SHOP: %6 SETUP: %7)", name _unit, getPlayerUID _unit, side _unit, typeOf _vehicle, [_price] call HC_fnc_numberSafe, _shop select 0, str _setUp];
["VehiceBuyLog", _msg] call HC_fnc_Log;
};

sleep 5;
_vehicle allowDamage true;