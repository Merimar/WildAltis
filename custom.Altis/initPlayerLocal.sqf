HEADLINE_ARRAY = [];
MESSAGE_ARRAY = [];
ID_ARRAY = [];

if (!hasInterface && !isServer) exitWith {
	if(profileName == "hc_1") then {
		[] call compile PreprocessFileLineNumbers "\life_hc\initHC.sqf";
	};
	if(profileName == "hc_2") then {
		[] call compile PreprocessFileLineNumbers "\map_hc\initHC.sqf";
	};
};

if(!(playerSide in [west, east, civilian, independent])) exitWith {["Error", true, false] call BIS_fnc_endMission;};

[] call life_fnc_disableChannel;
[] call life_fnc_initSkillSystem;
[] spawn life_fnc_loginMenu;