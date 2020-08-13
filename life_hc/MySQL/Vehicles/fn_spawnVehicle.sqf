#include "\life_hc\hc_macros.hpp"
private _unit = param [0, objNull, [objNull]];
private _vUID = param [1, 0, [0]];
private _sp = param [2, "", ["", []]];

private _isHacker = [[], _unit, remoteExecutedOwner, "fn_spawnVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

private _pID = getPlayerUID _unit;
private _pSide = side _unit;
private _pSideID = [_pSide] call HC_fnc_getGroupSideID;
private _databaseInformation = [_vUID, _pID, _pSide] call HC_fnc_getVehicleDatabase;
if(count _databaseInformation isEqualTo 0) exitWith {};
private _classname = _databaseInformation select 1;
private _active = _databaseInformation select 3;
private _color = _databaseInformation select 4;
private _material = _databaseInformation select 5;
private _insurance = _databaseInformation select 6;
private _impounded = _databaseInformation select 7;
private _insuranceName = _insurance isEqualTo 1;

if(_active isEqualTo 1) exitWith {};
if(_impounded isEqualTo 1) exitWith {};

private _storageFee = [_classname, side _unit] call HC_fnc_getStorageFee;
private _setUp = [_color, _material, _insuranceName];
private _pMoney = [_pID, "bank"] call HC_fnc_getMoney;

if(_pMoney < _storageFee) exitWith {
_reason1 = format ["Der Spieler %1 (%2 - %3) wollte ein Fahrzeug ausparken, kann sich die Ausparkkosten aber nicht leisten (%4 < %5)", name _unit, getPlayerUID _unit, side _unit, [_pMoney] call HC_fnc_numberSafe, [_storageFee] call HC_fnc_numberSafe];
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1", name _unit];
[_unit, "VehicleUnimpound Hack", [_reason1,_reason2], true] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein VehicleUnimpound Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

private _spInformation = [];
private _notPos = false;
if(_sp isEqualType "" && {_sp in ["GANG", "HOUSE"]}) then {
if(_sp == "GANG") then {
private _group = group _unit;
private _gangID = _group getVariable ["gang_id", 0];
private _gangIndex = PLAYER_GANG_ARRAY findIf {_x select 0 == _gangID};
if(_gangIndex isEqualTo -1) exitWith {};
private _garagePosition = + ((PLAYER_GANG_ARRAY select _gangIndex select 9) param [3, [0, 0, 0, 0]]);
private _garageDir = _garagePosition deleteAt 3;
if(count (nearestObjects [_garagePosition, ["Car", "Air", "Ship"], 10]) > 0) exitWith {};
_spInformation = [_garagePosition, _garageDir];
}else{
private _houseOne = nearestObject [getPos _unit, "Land_i_Garage_V1_F"];
private _houseTwo = nearestObject [getPos _unit, "Land_i_Garage_V2_F"];
private _houseObj = if(_houseOne distance player < _houseTwo distance player) then {_houseOne} else {_houseTwo};

private _garagePosition = _houseObj getVariable ["house_garage", [0, 0, 0, 0]];
private _garageDir = _garagePosition deleteAt 3;
if(count (nearestObjects [_garagePosition, ["Car", "Air", "Ship"], 10]) > 0) exitWith {};
_spInformation = [_garagePosition, _garageDir];
};
}else {
_sp = if(_sp isEqualType []) then {_sp select {count (nearestObjects[getMarkerPos _x,["Car","Air","Ship"],10]) isEqualTo 0}} else {[_sp] select {count (nearestObjects[getMarkerPos _x,["Car","Air","Ship"],10]) isEqualTo 0}};
if(count _sp isEqualTo 0) exitWith {};
private _markerPos = markerPos (_sp select 0);
private _markerDir = markerDir (_sp select 0);
if((_sp select 0) == "Spawn_Air_FW_2") then {_markerPos set [2, 20];};
if((_sp select 0) == "Spawn_Aircraft") then {_notPos = true;};
_spInformation = [_markerPos, _markerDir];
};

if(count _spInformation isEqualTo 0) exitWith {["Es steht bereits ein Fahrzeug auf dem Spawnpunkt", "Kein Spawnpunkt"] remoteExec ["life_fnc_message", _unit];};
if((_spInformation select 0) isEqualTo [0, 0, 0]) exitWith {["Deine Gang hat noch keinen Garagenspawn festgelegt. Ihr könnt im Haus Interaktionsmenu einen Spawnpunkt festlegen!", "Kein Spawnpunkt"] remoteExec ["life_fnc_message", _unit];};

private _spawnPoint = _spInformation select 0;
private _spawnDir = _spInformation select 1;

private _vehicle = createVehicle [_classname, _spawnPoint, [], 0, "NONE"];
waitUntil {!isNull _vehicle};

private _aiDrones = getArray (missionConfigFile >> "Life_Settings" >> "drones");
if(_classname in _aiDrones) then {createVehicleCrew _vehicle;};

_vehicle allowDamage false;
if(!_notPos) then {
_vehicle setPos _spawnPoint;
};
_vehicle setVectorUp (surfaceNormal _spawnPoint);
_vehicle setDir _spawnDir;
_vehicle lock 2;
_vehicle setVariable ["VehicleSetup", _setUp, true];
_vehicle setVariable ["trunk_in_use", false, true];
_vehicle setVariable ["vehicle_info_owners", [[_pID, name _unit]], true];
_vehicle setVariable ["dbInfo", [_pID, _pSide, _vUID], true];
_vehicle enableRopeAttach false;
clearWeaponCargo _vehicle;
clearMagazineCargo _vehicle;

if(_classname in _aiDrones) then {_vehicle lock 0;};

if(_classname == "O_APC_Wheeled_02_rcws_F" && _pSide isEqualTo west) then {
_vehicle animate ["showslathull", 1];
};

[_vehicle] call HC_fnc_addExplosionEH;
//[_vehicle] remoteExec ["TON_fnc_localEH", 2];
[_pID, _pSide, _vehicle, 1] call HC_fnc_keyManagement;
[_vehicle, _color, _material] call HC_fnc_colorVehicle;
[_vehicle, _pSide isEqualTo independent] call HC_fnc_clearVehicleAmmo;

_info = [_vehicle, [], 0];
VEHICLE_INV_ARRAY pushBack _info;
VEHICLE_LIST pushBack _vehicle;

[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain", _unit];
[_pID, "bank", _storageFee, false] call HC_fnc_handleMoney;
private _geheimZahl = [getPlayerUID _unit] call HC_fnc_getGeheimzahl;
[_storageFee, _geheimZahl] remoteExec ["life_fnc_unimpoundMoney", _unit];

private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
[format ["Du hast dein/en %1 ausgeparkt", _displayName], "Fahrzeug ausgeparkt"] remoteExec ["life_fnc_message", _unit];

private _msg = format ["Der Spieler %1 (%2 - %3) hat ein Fahrzeug ausgeparkt (FAHRZEUG: %4 SPAWNPUNKT: %5 SETUP: %6)", name _unit, _pID, _pSide, _displayName, _spawnPoint, str _setUp];
["UnimpoundLog", _msg] call HC_fnc_Log;

private _query = format["UPDATE vehicles SET active = '1' WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3' AND deleted_at IS NULL", _pID, _pSideID, _vUID];
[_query,1] call HC_fnc_asyncCall;

sleep 5;
_vehicle allowDamage true;