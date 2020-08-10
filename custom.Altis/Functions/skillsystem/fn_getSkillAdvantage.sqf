#include "..\script_macros.hpp"
private _skill = param [0, ""];
private _level = param [1, -1];
private _group = [_skill] call life_fnc_getSkillGroup;
private _advantage = [];

if(_level isEqualTo -1) then {
_level = [_skill] call life_fnc_getSkillLevel;
};

switch (_group) do {

case "character" : {
if(["heal"] call life_fnc_isBuffOn && _skill == "heal") then {_level = 30;};
_advantage = switch (_skill) do {
	case "heal" : {SKILL_HEAL_VALUE select _level;};
	case "stamina" : {SKILL_STAMINA_VALUE select _level;};
	case "lockpick" : {SKILL_LOCKPICK_CHANCE select _level;};
	case "repair" : {SKILL_REPAIR_TIME select _level;};
	case "boltcutter" : {SKILL_BOLTCUTTER_VALUE select _level;};
	case "impound" : {SKILL_IMPOUND_TIME select _level;};
	case "revive" : {SKILL_REPAIR_TIME select _level;};
	case "search" : {SKILL_SEARCH_CHANCE select _level;};
};
};

case "farm" : {
_advantage = switch (true) do {
	case (_skill in ["farmDrugs"]) : {SKILL_DRUGS_VALUE select _level;};
	case (_skill in ["farmFruit"]) : {SKILL_FRUIT_VALUE select _level;};
	case (_skill in ["farmGrapes", "farmSand"]) : {SKILL_LIGHTWEIGHT_VALUE select _level;};
	case (_skill in ["farmOre", "farmFossil", "farmStone"]) : {SKILL_HEAVYWEIGHT_VALUE select _level;};
	case (_skill in ["farmPost"]) : {SKILL_DP_VALUE select _level;};
};
};

case "process" : {
_advantage = SKILL_PROCESS_TIME select _level;
};

case "crafting" : {
_advantage = SKILL_CRAFTING_TIME select _level;
};
};

if(_skill == "stamina" && _advantage isEqualType []) then {_advantage = 100;};
if(_skill == "heal" && playerSide isEqualTo independent) then {_advantage = 0;};
if(_skill == "lockpick" && playerSide isEqualTo independent) then {_advantage = 100;};
if(_skill == "repair" && playerSide isEqualTo independent) then {_advantage = 0.2;};
if(_skill == "revive" && playerSide isEqualTo independent) then {_advantage = 0.2;};
_advantage;