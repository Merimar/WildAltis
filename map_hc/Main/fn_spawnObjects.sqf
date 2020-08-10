if(DEV_MODE) exitWith {diag_log "Es wurden keine Objekte erstellt, DEV MODE ist aktiviert!";};

//[] call MHC_fnc_simpleObjects;

sleep 1;

{
_x setVariable ["bis_disabled_Door_0", 1, true];
_x setVariable ["bis_disabled_Door_1", 1, true];
_x setVariable ["bis_disabled_Door_2", 1, true];
_x setVariable ["bis_disabled_Door_3", 1, true];
_x setVariable ["bis_disabled_Door_4", 1, true];
_x setVariable ["bis_disabled_Door_5", 1, true];
_x setVariable ["bis_disabled_Door_6", 1, true];
}forEach [zelle_1, zelle_2, zelle_3, zelle_4, zelle_5, zelle_6, zelle_7, zelle_8, zelle_9, zelle_10, zelle_11, zelle_13, zelle_14, zenti_part_2, zenti_part_3];