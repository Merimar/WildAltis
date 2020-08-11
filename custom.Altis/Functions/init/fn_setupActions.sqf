#include "..\script_macros.hpp"
life_actions = [];
switch (playerSide) do {
    case west: {
		life_actions = life_actions + [player addAction ["Sachen entfernen",life_fnc_seizeWeapon,cursorTarget,0,false,false,"",'count (nearestObjects [player,["weaponholder"],3]) >0']];
	};
};

life_actions = life_actions + [player addAction["Geld beschlagnahmen",life_fnc_copGetMoney,"",0,false,false,"",'!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && {cursorObject getVariable ["restrained", false]}']];
life_actions = life_actions + [player addAction["Ausrauben",life_fnc_robAction,"",0,false,false,"",'!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && (((lifeState cursorObject) in ["INCAPACITATED"]) || (animationState cursorObject) in ["amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"])']];
life_actions = life_actions + [player addAction["Selbstbehandlung",life_fnc_healAction,false,1,false,true,"",'((["firstaidkit"] call life_fnc_getItemValue) > 0) && {(damage player) > (["heal"] call life_fnc_getSkillAdvantage)} && {(!(player getVariable["restrained",false]))} && {isNull objectParent player}']];
life_actions = life_actions + [player addAction["Spieler behandeln",life_fnc_healAction,true,1,false,true,"",'((["firstaidkit"] call life_fnc_getItemValue) > 0) && {((speed cursorObject) < 1)} && {(damage cursorObject) > (["heal"] call life_fnc_getSkillAdvantage)} && {!isNull cursorObject} && {(player distance cursorObject) < 2} && {(!(player getVariable["restrained",false]))} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {isNull objectParent player}']];
life_actions = life_actions + [player addAction["Interagieren",life_fnc_interact,"",0,false,false,"",'!isNull cursorObject && isNull objectParent player && {player distance cursorObject < 3} && {cursorObject getVariable ["Interaction", false]}']];