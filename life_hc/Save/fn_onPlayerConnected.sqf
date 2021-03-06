private _uid = param [0, "", [""]];
private _owner = param [1, 0, [0]];
private _geheimZahl = param [2, 0, [0]];

//Secure
if(remoteExecutedOwner != 2) exitWith {
private _remInfo = [remoteExecutedOwner] call HC_fnc_getPlayerByID;
private _remSuccess = _remInfo select 1;
private _rem = _remInfo select 0;
diag_log format ["CONNECT HACK: %1 - %2", remoteExecutedOwner, _this];
if(!_remSuccess) exitWith {};
diag_log format ["Spieler: %1 (%2 - %3)", name _rem, getPlayerUID _rem, side _rem];
};

//Check if Player is allready connecting
if(_uid in JOIN_IN_PROGRESS) exitWith {DEBUG_ARRAY pushBack format ["Player allready connecting [onPlayerConnected]: %1", _this];};
JOIN_IN_PROGRESS pushBack _uid;

//Fetch connecting unit
private _connectingProcess = [_uid] spawn HC_fnc_getConnectingPlayer;
waitUntil {scriptDone _connectingProcess};
private _unit = missionNamespace getVariable [format["Player_%1", _uid], objNull];
if(isNull _unit) exitWith {DEBUG_ARRAY pushBack format ["Player null after connecting [onPlayerConnected]: %1", _this];};
missionNamespace setVariable [format["Player_%1", _uid], nil];

private _arrayID = format ["SAVE_ARRAY_%1", _uid];
missionNamespace setVariable [_arrayID, [_unit, _uid, side _unit, _owner, _geheimZahl, []]];

["ConnectionLog", format ["Der Spieler %1 (%2 - %3) hat sich eingeloggt", name _unit, _uid, side _unit]] call HC_fnc_log;

[_unit] call HC_fnc_queryPlayer;
[_unit] call HC_fnc_initPlaytime;

sleep 5;

[_unit] call HC_fnc_initPaycheck;