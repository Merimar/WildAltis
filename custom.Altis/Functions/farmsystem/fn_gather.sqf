#include "..\script_macros.hpp"
if(life_action_inUse || !isNull objectParent player || {player getVariable ["restrained", false]} || {player getVariable ["playerSurrender", false]}) exitWith {};

if(JAIL_TIME > 0 && STONE_COUNTER >= STONE_MAX_COUNTER) exitWith {};

private _routeConfig = "true" configClasses (missionConfigFile >> "CfgFarmRoutes");
private _route = _routeConfig select {
_fields = getArray (_x >> "fields");
_zoneSize = getNumber (_x >> "farmZonesize");
_isIn = count (_fields select {(player distance (getMarkerPos _x)) < _zoneSize}) > 0;
_isIn;
};

if(count _route isEqualTo 0 && JAIL_TIME <= 0) exitWith {};
_route = if(JAIL_TIME > 0) then {missionConfigFile >> "CfgFarmRoutes" >> "Stone"} else {_route select 0};

private _buff = if(["farm"] call life_fnc_isBuffOn) then {2} else {1};
if(JAIL_TIME > 0) then {_buff = 1};

private _farmTime = if((ceil (getNumber (_route >> "farmTime") / _buff)) < 1) then {1} else {ceil (getNumber (_route >> "farmTime") / _buff)};
private _farmItem = getText (_route >> "gatherItem");
private _displayName = getText (missionConfigFile >> "Items" >> _farmItem >> "name");
private _farmName = getText (_route >> "name");
private _farmSkill = getText (_route >> "gatherSkill");
private _farmTool = getText (_route >> "gatherTool");
private _amountArray = [_farmSkill] call life_fnc_getRandomFarm;
private _random = round(random(100)) + 1;
private _amount = if(!(configName _route in ["Pakete", "Briefe", "Relikt", "Helium", "Dunkle", "Stone"])) then {_amountArray} else {1};
private _farmToolAmount = [_farmTool] call life_fnc_getItemValue;
private _farmToolName = getText (missionConfigFile >> "Items" >> _farmTool >> "name");
if(_amount <= 0) then {_amount = 1;};

if(_farmToolAmount isEqualTo 0 && _farmTool != "") exitWith {[format ["Du brauchst ein Farmtool zum Farmen von %1<br/><br/>Farmtool: %2", _farmName, _farmToolName], "Kein Farmtool"] spawn life_fnc_message;};

private _diff = if(!(configName _route in ["Stone"])) then {[_farmItem, _amount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff} else {_amount;};

if(_diff isEqualTo 0 && JAIL_TIME <= 0) exitWith {["", "Dein Inventar ist voll"] spawn life_fnc_message;};

private _sound = switch (_farmTool) do {case "pickaxe": {"mining"}; default {"harvest"};};
if(JAIL_TIME > 0) then {_sound = "mining";};
player say3D _sound;

private _exit = false;
life_action_inUse = true;

for "_int" from 1 to _farmTime step 1 do {
if(!isNull objectParent player) exitWith {["", "Du kannst nicht abbauen, wenn du in einem Fahrzeug sitzt!"] spawn life_fnc_message;_exit = true;};
if(life_isDead) exitWith {_exit = true;};
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
uiSleep 2.5;
};

life_action_inUse = false;
if(_exit) exitWith {};
if(playerSide in [west, independent]) exitWith {};

//if(time - LAST_GATHER_TIMER < 2) exitWith {titleText ["Du wurdest beim Bugfarmen erwirscht, melde dich im Support mit @Bugfarmen oder du wirst für einen Monat gebannt", "PLAIN"];};
//LAST_GATHER_TIMER = time;

if(JAIL_TIME > 0) exitWith {
STONE_COUNTER = STONE_COUNTER + 1;
titleText [format ["Du hast %1 / %2 Steinen gesammelt", STONE_COUNTER, STONE_MAX_COUNTER], "PLAIN"];
if(STONE_COUNTER >= STONE_MAX_COUNTER) then {
["Du hast genügend Steine gesammelt um auf den Hof zu kommen", "Gefängnis"] spawn life_fnc_message;
[player, "STONE"] remoteExec ["HC_fnc_jailOutcome", HC_LIFE];
};
};

[true, _farmItem, _diff] call life_fnc_handleInv;
titleText [format ["Du hast %1 %2 gesammelt", _diff, _displayName], "PLAIN"];
[player, configName _route, _diff] remoteExec ["HC_fnc_gather", HC_LIFE];

if((configName _route) in ["Helium", "Dunkle", "Relikt"]) exitWith {};
[_farmSkill] call life_fnc_addSkill;