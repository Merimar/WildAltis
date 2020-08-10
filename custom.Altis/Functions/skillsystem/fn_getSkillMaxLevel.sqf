_skill = param [0, ""];

private _return = switch (true) do {

	case (_skill == "heal") : {(count SKILL_HEAL_VALUE)-1};
	case (_skill == "stamina") : {(count SKILL_STAMINA_VALUE)-1};
	case (_skill == "lockpick") : {(count SKILL_LOCKPICK_CHANCE)-1};
	case (_skill in ["repair", "revive"]) : {(count SKILL_REPAIR_TIME)-1};
	case (_skill == "boltcutter") : {(count SKILL_BOLTCUTTER_VALUE)-1};
	case (_skill == "impound") : {(count SKILL_IMPOUND_TIME)-1};
	case (_skill == "search") : {(count SKILL_SEARCH_CHANCE)-1};
	case (_skill in ["farmGrapes", "farmSand", "farmPost"]) : {(count SKILL_LIGHTWEIGHT_VALUE)-1};
	case (_skill in ["farmOre", "farmFossil", "farmStone"]) : {(count SKILL_HEAVYWEIGHT_VALUE)-1};
	case (_skill == "farmDrugs") : {(count SKILL_DRUGS_VALUE)-1};
	case (_skill == "farmFruit") : {(count SKILL_FRUIT_VALUE)-1};
	case ("process" in _skill) : {(count SKILL_PROCESS_TIME)-1};
	case ("craft" in _skill) : {(count SKILL_CRAFTING_TIME)-1};

};

_return;