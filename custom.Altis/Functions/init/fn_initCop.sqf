if(call life_coplevel isEqualTo 0 && call life_adminlevel < 2) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

{
_x setVariable ["bis_disabled_Door_0", 0];
_x setVariable ["bis_disabled_Door_1", 0];
_x setVariable ["bis_disabled_Door_2", 0];
_x setVariable ["bis_disabled_Door_3", 0];
_x setVariable ["bis_disabled_Door_4", 0];
_x setVariable ["bis_disabled_Door_5", 0];
_x setVariable ["bis_disabled_Door_6", 0];
_x setVariable ["bis_disabled_Door_7", 0];
_x setVariable ["bis_disabled_Door_8", 0];
_x setVariable ["bis_disabled_Door_9", 0];
_x setVariable ["bis_disabled_Door_10", 0];
_x setVariable ["bis_disabled_Door_11", 0];
_x setVariable ["bis_disabled_Door_12", 0];
}forEach [zelle_1, zelle_2, zelle_3, zelle_4, zelle_5, zelle_6, zelle_7, zelle_8, zelle_9, zelle_10, zelle_11, zelle_13, zelle_14, zenti_part_2, zenti_part_3];