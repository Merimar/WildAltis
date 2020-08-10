#include "..\script_macros.hpp"
private _unit = param [0, objNull];
life_corpse = param [1, objNull];
private _itemList = [];

10 cutText ["", "PLAIN"];

private _info = [getPlayerUID player, name player, life_virt_gear, CASH];
life_corpse setVariable ["Loot_Information", _info, true];
life_virt_gear = [];
CASH = 0;

//Wichtig
player setVariable ["restrained", false, true];
player setVariable ["Escorting", false, true];
player setVariable ["transporting", false, true];
player setVariable ["execution", false, true];
player allowDamage false;

_unit addRating 1e12;
player playMoveNow "AmovPpneMstpSrasWrflDnon";

[CURRENT_DEAD_UNIT, CURRENT_DEAD_KILLER, player] remoteExec ["HC_fnc_playerKilled", HC_LIFE];
[] call life_fnc_setupActions;
[] call life_fnc_fixSpace;