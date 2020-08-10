if(call life_medicLevel isEqualTo 0 && call life_adminlevel < 2) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};