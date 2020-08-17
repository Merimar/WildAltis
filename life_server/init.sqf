DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
life_server_extDB_notLoaded = "";
MONEY_PICKUP = [];
GEHEIM_ZAHL = [];
life_HC_isActive = false;
life_LogHC_isActive = false;
HC_Life = false;
HC_Log = false;
UPTIME_TIME = time;

publicVariable "life_server_isReady";
publicVariable "life_HC_isActive";
publicVariable "life_LogHC_isActive";
publicVariable "HC_Life";
publicVariable "HC_Log";
publicVariable "UPTIME_TIME";

estimatedTimeLeft 36000;

[] execVM "\life_server\initHC.sqf";

if (isNil {uiNamespace getVariable "life_sql_id"}) then {
    life_sql_id = round (random 9999);
    uiNamespace setVariable ["life_sql_id", life_sql_id];
	life_sql_id = compileFinal str life_sql_id;
        try {
        _result = "extDB3" callExtension format["9:ADD_DATABASE:%1", "altis_life"];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = "extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2", call life_sql_id, "altis_life"];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        life_server_extDB_notLoaded = [true, _exception];
    };
    publicVariable "life_server_extDB_notLoaded";
    if (life_server_extDB_notLoaded isEqualType []) exitWith {};
    "extDB3" callExtension "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    life_sql_id = compileFinal str (uiNamespace getVariable ["life_sql_id", 0]);
    diag_log "extDB3: Still Connected to Database";
};

if (life_server_extDB_notLoaded isEqualType []) exitWith {};

["UPDATE hacklog SET amount = '0'", 1] call DB_fnc_asyncCall;
["UPDATE vehicles SET active = '0'", 1] call DB_fnc_asyncCall;

private _timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Altis Life Server Init ---------------------------------";
diag_log "------------------------------------------ Version 4.4R3 -------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

diag_log format ["A3Log Loaded. Version: %1",("A3Log" callExtension "version")];

"A3Log" callExtension "------------------------------------------------------";
"A3Log" callExtension "--------------------SERVER RESTART--------------------";
"A3Log" callExtension "------------------------------------------------------";

EAST setFriend [CIVILIAN, 1];
EAST setFriend [WEST, 1];
EAST setFriend [RESISTANCE, 1];

CIVILIAN setFriend [EAST, 1];
CIVILIAN setFriend [WEST, 1];
CIVILIAN setFriend [RESISTANCE, 1];

WEST setFriend [EAST, 1];
WEST setFriend [CIVILIAN, 1];
WEST setFriend [RESISTANCE, 1];

RESISTANCE setFriend [EAST, 1];
RESISTANCE setFriend [CIVILIAN, 1];
RESISTANCE setFriend [WEST, 1];

addMissionEventHandler ["HandleDisconnect", {_this call TON_fnc_clientDisconnect; false;}];
addMissionEventHandler ["PlayerConnected", {_this spawn TON_fnc_clientConnected; false;}];
[] call compile PreProcessFileLineNumbers "\life_server\functions.sqf";

SIDECHAT_COP = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
SIDECHAT_CIV = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
SIDECHAT_MED = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

publicVariable "SIDECHAT_COP";
publicVariable "SIDECHAT_CIV";
publicVariable "SIDECHAT_MED";

life_server_isReady = true;
publicVariable "life_server_isReady";

life_map_loaded = false;
publicVariable "life_map_loaded";

{
private _position = _x select 0;
private _id = _x select 1;
private _random = round(random(100));
if(_random < 75) then {
_obj = (_position nearestObject _id);
_obj hideObjectGlobal true;
_obj allowDammage false;
_obj enableSimulation false;
diag_log format ["Tower an Stelle: %1 removed", _position];
};
}forEach [[[14226, 21209, 0], 1295078], [[16588, 19042, 0], 470480], [[23481, 21094, 0], 1545423], [[12302, 8865, 0], 758574], [[8320, 10056, 0], 832000], [[6830, 16052, 0], 1070000], [[12438, 15192, 0], 681790], [[12813, 16631, 0], 673154], [[12792, 16703, 0], 673047], [[16838, 12043, 0], 927911], [[17475, 13209, 0], 929892], [[15514, 15767, 0], 541922]];



diag_log "Objects hided succesfully";
waitUntil {life_map_loaded};
diag_log "Map loaded succesfully";

[] execVM "\life_server\sendTimeUpdate.sqf"; //Zeit Update für Clients
//[] execVM "\life_server\initTime.sqf"; //Restart Zeit Broadcast
[] execVM "\life_server\initTimeModule.sqf"; //Time Modul
[] execVM "\life_server\initWeather.sqf"; //Weather Modul
[] execVM "\life_server\initVehicleLocal.sqf"; //Weather Modul

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format["               End of Altis Life Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
