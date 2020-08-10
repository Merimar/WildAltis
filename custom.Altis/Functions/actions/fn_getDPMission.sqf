#include "..\script_macros.hpp"
private _target = param [0, objNull];
if(isNull _target) exitWith {};

private _dpName = str _target;
private _allPoints = getArray (missionConfigFile >> "Life_Settings" >> "delivery_points");
private _mission = selectRandom (_allPoints select {_x != _dpName});

DP_MISSION_START = _target;
DP_MISSION_ACTIVE = true;
DP_MISSION_END = call compile format["%1",_mission];

_mission = [_mission,"_"," "] call KRON_Replace;
DP_MISSION_TASK = player createSimpleTask [format["Delivery_%1", _mission]];
DP_MISSION_TASK setSimpleTaskDescription [format["Du musst dieses Paket bei %1 abliefern", toUpper _mission],"Delivery Job",""];
DP_MISSION_TASK setTaskState "Assigned";
player setCurrentTask DP_MISSION_TASK;

["DeliveryAssigned",[format["Liefere dieses Paket bei %1 ab", toUpper _mission]]] call bis_fnc_showNotification;

[] spawn {
    waitUntil {sleep 1; !DP_MISSION_ACTIVE || life_isDead};
    if (life_isDead) then {
        DP_MISSION_TASK setTaskState "Failed";
        player removeSimpleTask DP_MISSION_TASK;
        ["DeliveryFailed",["Du hast es nicht geschafft, das Paket abzuliefern, da du gestorben bist"]] call BIS_fnc_showNotification;
        DP_MISSION_ACTIVE = false;
        DP_MISSION_START = nil;
    };
};