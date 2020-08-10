disableSerialization;
private _veh = cursorObject;
private _speed = ["repair"] call life_fnc_getSkillAdvantage;

if(isNull _veh || !("ToolKit" in (items player))) exitWith {};
if(player distance _veh >= 20) exitWith {};

private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
private _title = format ["Repariere %1", _displayName];

life_action_inUse = true;
life_interrupted = false;

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;

_pgText ctrlSetText format["%2 (1%1)...", "%", _title];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync", -2];
player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
};

sleep _speed;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
if(_cP >= 1 || life_isDead || !isNull objectParent player || life_interrupted) exitWith {};
};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(_cP < 1) exitWith {life_interrupted = false;titleText["Aktion abgebrochen","PLAIN"];};
if(!(playerSide isEqualTo independent)) then {player removeItem "ToolKit";};

titleText["Fahrzeug erfolgreich repariert", "PLAIN"];
["repair"] call life_fnc_addSkill;
[player, _veh] remoteExec ["HC_fnc_repairVehicle", HC_LIFE];