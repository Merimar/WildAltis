#include "..\script_macros.hpp"
private _mission = param [0, objNull];
if(isNull _mission) exitWith {};

DP_MISSION_ACTIVE = false;
DP_MISSION_END = nil;

private _price = round(5.0 * (DP_MISSION_START distance _mission));
private _extraMoney = (["farmPost"] call life_fnc_getSkillAdvantage) * 1000;
_price = _price + _extraMoney;

["DeliverySucceeded",[format["Du hast €%1 verdient (+€%2 durch Bonus)", [_price - _extraMoney] call life_fnc_numberText], [_extraMoney] call life_fnc_numberText]]] call bis_fnc_showNotification;
DP_MISSION_TASK setTaskState "Succeeded";
player removeSimpleTask DP_MISSION_TASK;
CASH = CASH + _price;

["farmPost", floor((DP_MISSION_START distance _mission) / 625)] call life_fnc_addSkill;
[player, DP_MISSION_START, _mission, _price] remoteExec ["HC_fnc_dpFinish", HC_LIFE];
DP_MISSION_START = nil;