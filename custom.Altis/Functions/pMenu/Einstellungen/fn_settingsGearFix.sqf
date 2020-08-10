if((time - life_action_delay) < 60) exitWith {playSound "error";};
life_action_delay = time;
player setUnitLoadout (getUnitLoadout player);