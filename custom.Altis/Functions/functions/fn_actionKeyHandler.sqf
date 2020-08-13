#include "..\script_macros.hpp"
CUR_PLAYER_IDC = cursorObject;
if(life_interrupted) then {life_interrupted = false;};
if(dialog || !isNull objectParent player || {player getVariable ["restrained", false]} || {player getVariable ["playerSurrender", false]} || life_isknocked && life_istazed) exitWith {};
private _isWater = surfaceIsWater (visiblePositionASL player);
if((markerPos "Farm_Relikttempel_1") distance player < 20) then {_isWater = false;};

if(player getVariable ["isEscorting",false]) exitWith {
	CUR_PLAYER_IDC = player getVariable ["escortingPlayer", objNull];
	[] call life_fnc_interactionMenu;
};

if("atm_" in str CUR_PLAYER_IDC && player distance CUR_PLAYER_IDC < 4 && !dialog && !(".p3d" in str CUR_PLAYER_IDC)) exitWith {
	[] call life_fnc_atmMenu;
};

if(CUR_PLAYER_IDC getVariable ["Interaction", false] && player distance CUR_PLAYER_IDC < 3 && isNull objectParent player) exitWith {
	[] call life_fnc_interact;
};

if(CUR_PLAYER_IDC isKindOf "House_F" && {player distance CUR_PLAYER_IDC < 30} && JAIL_TIME isEqualTo 0) exitWith {
    CUR_VEHICLE_IDC = CUR_PLAYER_IDC;
	[CUR_PLAYER_IDC] call life_fnc_houseInteraction;
};

if(CUR_PLAYER_IDC isKindOf "Man" && !(alive CUR_PLAYER_IDC) && player distance CUR_PLAYER_IDC < 5) exitWith {
	if(playerSide isEqualTo independent && !(CUR_PLAYER_IDC getVariable["Revive",false])) exitWith {[CUR_PLAYER_IDC] call life_fnc_interactionMenu;};
	if(!(playerSide isEqualTo independent)) then {[CUR_PLAYER_IDC] call life_fnc_openLootMenu;};
};

if(CUR_PLAYER_IDC isKindOf "Man" && isPlayer CUR_PLAYER_IDC && alive CUR_PLAYER_IDC && player distance CUR_PLAYER_IDC < 5) exitWith {
	[CUR_PLAYER_IDC] call life_fnc_interactionMenu;
};

private _howMuch = if(CUR_PLAYER_IDC isKindOf "Air") then {10} else {4};
if(CUR_PLAYER_IDC isKindOf "LandVehicle" || CUR_PLAYER_IDC isKindOf "Ship" || CUR_PLAYER_IDC isKindOf "Air" && player distance CUR_PLAYER_IDC < ((boundingBox CUR_PLAYER_IDC select 1) select 0) + _howMuch) exitWith {
	CUR_VEHICLE_IDC = CUR_PLAYER_IDC;
	[CUR_VEHICLE_IDC] call life_fnc_vehicleInteractionMenu;
};

if(_isWater && isNull CUR_PLAYER_IDC) then {
private _fishArray = nearestObjects[player, ["Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F"], 3];
if(count _fishArray isEqualTo 0) exitWith {};
private _fish = _fishArray select 0;
[_fish] spawn life_fnc_gatherFish;
};

if(!life_action_gathering) exitWith {
	private _handle = [] spawn life_fnc_gather;
	life_action_gathering = true;
	waitUntil {scriptDone _handle};
	life_action_gathering = false;
};