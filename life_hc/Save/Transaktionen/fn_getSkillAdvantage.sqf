private _pID = param [0, ""];
private _pSkill = param [1, ""];
private _pPoints = [_pID, _pSkill] call HC_fnc_getSkill;
private _pLevel = [_pSkill, _pPoints] call HC_fnc_getSkillLevel;

private _skillGroup = switch (true) do {
case ("farm" in _pSkill) : {"farm"};
case ("process" in _pSkill) : {"process"};
case ("craft" in _pSkill) : {"crafting"};
default {"character"};
};

private _advantage = [];

switch (_skillGroup) do {
case "character" : {
_advantage = switch (_pSkill) do {
	case "heal" : {SKILL_HEAL_VALUE select _pLevel;};
	case "stamina" : {SKILL_STAMINA_VALUE select _pLevel;};
	case "lockpick" : {SKILL_LOCKPICK_CHANCE select _pLevel;};
	case "repair" : {SKILL_REPAIR_TIME select _pLevel;};
	case "boltcutter" : {SKILL_BOLTCUTTER_VALUE select _pLevel;};
	case "impound" : {SKILL_IMPOUND_TIME select _pLevel;};
	case "revive" : {SKILL_REPAIR_TIME select _pLevel;};
	case "search" : {SKILL_SEARCH_CHANCE select _pLevel;};
};
};

case "farm" : {
_advantage = switch (true) do {
	case (_pSkill in ["farmDrugs"]) : {SKILL_DRUGS_VALUE select _pLevel;};
	case (_pSkill in ["farmFruit"]) : {SKILL_FRUIT_VALUE select _pLevel;};
	case (_pSkill in ["farmGrapes", "farmSand"]) : {SKILL_LIGHTWEIGHT_VALUE select _pLevel;};
	case (_pSkill in ["farmOre", "farmFossil", "farmStone"]) : {SKILL_HEAVYWEIGHT_VALUE select _pLevel;};
	case (_pSkill in ["farmPost"]) : {SKILL_DP_VALUE select _pLevel;};
};
};

case "process" : {
_advantage = SKILL_PROCESS_TIME select _pLevel;
};

case "crafting" : {
_advantage = SKILL_CRAFTING_TIME select _pLevel;
};
};

private _saveState = [_pID] call HC_fnc_getSave;
if(count (_saveState select SAVE_STATE_INDEX) isEqualTo 0) exitWith {0};
private _pSide = _saveState select 2;

if(_pSkill == "heal" && _pSide isEqualTo independent) then {_advantage = 0;};

_advantage;