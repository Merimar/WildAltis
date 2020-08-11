private _healPlayer = param [0, objNull, [objNull]];
private _anderer = param [3, false, [false]];
if(isNull _healPlayer) then {_healPlayer = player;};
if(_anderer) then {_healPlayer = cursorObject;};
if(life_action_inUse) exitWith {};
if(vehicle player != player) exitWith {};

private  _move = if((animationState player) == "amovppnemstpsraswrfldnon") then {"AinvPpneMstpSlayWrflDnon_medic"}else{"ainvpknlmstpslaywrfldnon_medic"};
[player,_move,true] remoteExecCall ["life_fnc_healSync",-2];
life_action_inUse = true;
life_healing = true;

waitUntil {(animationState player) == _move};
waitUntil {(animationState player) != _move};
life_action_inUse = false;
life_healing = false;
if(life_isDead || (vehicle player) != player) exitWith {};
if((_healPlayer distance player) > 2 || isNull _healPlayer) exitWith {["Heilen abgebrochen", true, "slow"] call life_fnc_showNotification;};

private  _exit = false;
if(!(playerSide isEqualTo independent)) then {
if(!([false,"firstaidkit",1] call life_fnc_handleInv)) exitWith {["Du hast keinen Verbandskasten", true, "slow"] call life_fnc_showNotification;_exit = true;};
};
if(_exit) exitWith {};
if(_healPlayer isEqualTo player) then {[player] remoteExec ["HC_fnc_healPlayer", HC_LIFE];}else {[player, _healPlayer] remoteExec ["HC_fnc_healPlayer", HC_LIFE];};
[] call life_fnc_hudUpdate;
["heal"] call life_fnc_addSkill;