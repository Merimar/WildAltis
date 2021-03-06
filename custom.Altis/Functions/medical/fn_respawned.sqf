life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_isDead = false;

player playMove "AmovPercMstpSnonWnonDnon";
player setVariable ["isDead", false, true];

life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
dynamicBlur ppEffectEnable false;
ppEffectDestroy dynamicBlur;
colorCorrection ppEffectEnable false;
ppEffectDestroy colorCorrection;

if (JAIL_TIME > 0) then {
	["Durch deinen Suizid Versuch bleibst du ein bischen laenger im Knast", "Gefängnis"] spawn life_fnc_message;
    [JAIL_TIME, life_geheimZahl] call life_fnc_jailMe;
};

private _handle = switch (playerSide) do {
	case civilian : {[] spawn life_fnc_civLoadout;};
	case east : {[] spawn life_fnc_civLoadout;};
	case independent : {[] spawn life_fnc_medicLoadout;};
	case west : {[] spawn life_fnc_copLoadout;};
};

closeDialog 0;
waitUntil {scriptDone _handle};

[] call life_fnc_spawnMenu;
[] call life_fnc_hudUpdate;
[] call life_fnc_disableChannel;

sleep 1;
[player, life_corpse] remoteExec ["HC_fnc_playerRespawned", HC_LIFE];