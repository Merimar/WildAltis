/*
    File: fn_initHC.sqf
    Author: Merimar

    Description:
    Initialize the headless client.
*/
_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------ Starting Altis Life MAPHC Init --------------------------------";
diag_log "-------------------------------------------- Version 4.3.1 -----------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

DEV_MODE = false;

//_handle = [] spawn MHC_fnc_spawnMarker;
//waitUntil {scriptDone _handle};
_handle = [] spawn MHC_fnc_spawnObjects;
waitUntil {scriptDone _handle};

[] spawn MHC_fnc_refreshMarker;

life_MapHC_isActive = true;
life_map_loaded = true;
publicVariable "life_MapHC_isActive";
publicVariable "life_map_loaded";
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["                 End of Altis Life HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
