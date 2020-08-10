#include "..\script_macros.hpp"

WALK_CURRENT = 0;
private _walkSkill = ["stamina"] call life_fnc_getSkillAdvantage;

player setFatigue 0;
player enableFatigue false;
player enableStamina false;

while {true} do {
	[] call life_fnc_hudUpdate;
	sleep 0.25;
	if(isNull (findDisplay 7300)) then {
		private _speed = speed player;
		if(!(isNull objectParent player) || abs _speed <= 10) exitWith {WALK_CURRENT = WALK_CURRENT - 0.5; if(WALK_CURRENT < 0) then {WALK_CURRENT = 0;};};
		private _add = if(_speed > 15 && !HALO_PROCCESS) then {1.5} else {0};
		WALK_CURRENT = WALK_CURRENT + _add;
		if(WALK_CURRENT < _walkSkill) exitWith {};
		life_thirst = life_thirst - 2;
		life_hunger = life_hunger - 2;
		["stamina"] call life_fnc_addSkill;
		[player] remoteExec ["HC_fnc_staminaUpdate", HC_LIFE];
		_walkSkill = ["stamina"] call life_fnc_getSkillAdvantage;
		_buff = ["stamina"] call life_fnc_isBuffOn;
		player enableFatigue true;
		player setFatigue 1;
		WALK_CURRENT = _walkSkill;
		[] call life_fnc_hudUpdate;
		for "_int" from 0 to 60 step 1 do {
			if(REDGULL) exitWith {player setFatigue 0;player enableFatigue false;}; //REDGULL
			if(_buff) exitWith {player setFatigue 0;player enableFatigue false;}; //BUFF
			if(WALK_CURRENT isEqualTo 0) exitWith {player setFatigue 0;player enableFatigue false;}; //WASSER
			if(!(isNull (findDisplay 7300))) exitWith {player setFatigue 0;player enableFatigue false;}; //TOT
			if(!(getFatigue player isEqualTo 1)) then {player enableFatigue true;player setFatigue 1;}; //STAMINA RESET
			sleep 1;
		};
		WALK_CURRENT = 0;
		player setFatigue 0;
		player enableFatigue false;
		player enableStamina false;
	}else {
		WALK_CURRENT = 0;
		player setFatigue 0;
		player enableFatigue false;
		player enableStamina false;
	};
};