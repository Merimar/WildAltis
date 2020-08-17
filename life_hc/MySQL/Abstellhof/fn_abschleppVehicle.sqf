private _vehicle = param [0, objNull, [objNull]];
private _unit = param [1, objNull, [objNull]];
private _action = if(param [2, false, [false]]) then {1} else {0};

if(isNull _vehicle) exitWith {};
private _dbInfo = _vehicle getVariable["dbInfo", []];
private _rent = _vehicle getVariable ["rent", false];

private _info = if(_rent) then {[]} else {[_dbInfo param [0, ""], _dbInfo param [1, ""], _dbInfo param [2, ""]]};

private _isHacker = [_info, _unit, remoteExecutedOwner, "fn_abschleppVehicle"] call HC_fnc_checkSQLBreak;
if(_isHacker) exitWith {};

if(count _dbInfo isEqualTo 0 && !_rent) exitWith {
["Dieses Fahrzeug besitzt keine Datenbank Informationen, wende dich an den Support", "Keine ID"] remoteExec ["life_fnc_message", _unit];
deleteVehicle _vehicle;
_reason1 = "Das Fahrzeug hatte keine Datenbank Info";
_reason2 = format ["Spieler welcher mit RemoteExecutedOwner rausgefunden wurde: %1 (%2)", name _unit, getPlayerUID _unit];
[_unit, "Abschlepp Hack", [_reason1,_reason2], false] call HC_fnc_reportHacker;
[format["Bei dem Spieler %1 wurde ein Abschlepp Hack festgestellt", name _unit], false] call HC_fnc_adminMessage;
};

if(alive _vehicle) then {
if(_rent) exitWith {
private _vOtherInfo = _vehicle getVariable ["vehicle_info_owners", []];
deleteVehicle _vehicle;
[getPlayerUID _unit, "impound"] call HC_fnc_addSkill;
_msg = format ["Der Spieler %1 (%2 - %3) hat ein gemietetes Fahrzeug des Spielers %4 (%5) abgeschlept", name _unit, getPlayerUID _unit, side _unit, _vOtherInfo param [0, []] param [1, "Kein Name"], _vOtherInfo param [0, []] param [0, "Keine PID"]];
["VehicleImpoundLog", _msg] call HC_fnc_Log;
};

private _pID = _dbInfo select 0;
private _pSide = _dbInfo select 1;
private _vUID = _dbInfo select 2;
private _sideID = [_pSide] call HC_fnc_getSideID;

private _query = format["UPDATE vehicles SET active = '0', impounded = '%4' WHERE owner_id = '%1' AND side_id = '%2' AND vuid = '%3' AND deleted_at IS NULL", _pID, _sideID, _vUID, _action];
[_query,1] call HC_fnc_asyncCall;

private _playerIndex = playableUnits findIf {getPlayerUID _x == _pID};
private _msg = if(_action isEqualTo 0) then {"abgeschlept"} else {"beschlagnahmt"};

if(_playerIndex > 0) then {[format["Dein Fahrzeug wurde von %1 %2", name _unit, _msg], format["Fahrzeug %1", _msg]] remoteExec ["life_fnc_message", playableUnits select _playerIndex];};

[format["Du hast ein Fahrzeug %1", _msg], format["Fahrzeug %1", _msg]] remoteExec ["life_fnc_message", _unit];
[getPlayerUID _unit, "impound"] call HC_fnc_addSkill;

_msg = format ["Der Spieler %1 (%2 - %3) hat das Fahrzeug des Spielers mit der PID: %4 - %5 (VUID: %6 FAHRZEUG: %7 POSITION: %8)", name _unit, getPlayerUID _unit, side _unit, _pID, _pSide, _vUID, typeOf _vehicle, getPos _unit];
["VehicleImpoundLog", _msg] call HC_fnc_Log;
};

if (!isNull _vehicle) then {deleteVehicle _vehicle;};