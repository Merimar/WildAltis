private _uid = _this select 0;
private _owner = _this select 1;
private _geheimZahl = _this select 2;

if(remoteExecutedOwner != 2) exitWith {
private _remInfo = [remoteExecutedOwner] call HC_fnc_getPlayerByID;
private _remSuccess = _remInfo select 1;
private _rem = _remInfo select 0;
diag_log format ["CONNECT HACK: %1 - %2", remoteExecutedOwner, _this];
if(!_remSuccess) exitWith {};
diag_log format ["Spieler: %1 (%2 - %3)", name _rem, getPlayerUID _rem, side _rem];
};

if(_uid in JOIN_IN_PROGRESS) exitWith {DEBUG_ARRAY pushBack format ["Player allready connecting [onPlayerConnected]: %1", _this];};
JOIN_IN_PROGRESS pushBack _uid;

private _connectingProcess = [_uid] spawn HC_fnc_getConnectingPlayer;
waitUntil {scriptDone _connectingProcess};
private _unit = missionNamespace getVariable [format["Player_%1", _uid], objNull];
if(isNull _unit) exitWith {DEBUG_ARRAY pushBack format ["Player null after connecting [onPlayerConnected]: %1", _this];};
missionNamespace setVariable [format["Player_%1", _uid], nil];

private _index = [_uid, side _unit] call HC_fnc_searchArray;

if(_index isEqualTo -1) then {
_index = SAVE_ARRAY pushBackUnique [_uid, side _unit, _owner, [], _geheimZahl];
["ConnectionLog", format ["Der Spieler %1 (%2 - %3) hat sich eingeloggt", name _unit, _uid, side _unit]] call HC_fnc_log;
}else {
["ConnectionLog", format ["Der Spieler %1 (%2 - %3) hat reloggt", name _unit, _uid, side _unit]] call HC_fnc_log;
};

(SAVE_ARRAY select _index) set [2, _owner];
[_uid, side _unit, _owner, name _unit, _index, _unit] call HC_fnc_queryPlayer;
[_uid, side _unit] call HC_fnc_initPlaytime;
sleep 5;
[_unit, _uid] call HC_fnc_initPaycheck;