#include "..\script_macros.hpp"
disableSerialization;
private _target = param [0, objNull];

if(isNull _target) exitWith {};

private _reviveCost = 10000;
private _speed = ["revive"] call life_fnc_getSkillAdvantage;
private _revivingPlayer = _target getVariable ["Reviving", objNull];

if(!(isNull _revivingPlayer)) exitWith {["Dieser Spieler wird bereits von einem anderen Spieler wiederbelebt", "Wiederbeleben"] spawn life_fnc_message;};

private _targetName = (_target getVariable ["Loot_Information", ["", ""]]) select 1;
private _title = "Belebe Spieler wieder";

life_action_inUse = true;
_target setVariable ["Reviving", player, true];

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable ["life_progress", displayNull];
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...", "%", _title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync", -2];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep _speed;
	if (isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
    _cP = _cP + .01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
    if (_cP >= 1 || life_isDead || life_istazed || life_isknocked || life_interrupted || {player getVariable["restrained",false]} || isNull _target) exitWith {life_interrupted = false;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
life_action_inUse = false;
_target setVariable ["Reviving", nil, true];

if(_cP < 1) exitWith {};

if(!((side _target) isEqualTo independent)) then {
    BANK = BANK + (_reviveCost * 5);
    ["revive"] call life_fnc_addSkill;
    [format ["Du hast den Spieler %1 wiederbelebt. Du bekommst €%2", _targetName, (_reviveCost * 5)], "Spieler wiederbelebt"] spawn life_fnc_message;
} else {
    [format ["Du hast den Spieler %1 wiederbelebt.", _targetName], "Spieler wiederbelebt"] spawn life_fnc_message;
};

[player] remoteExecCall ["life_fnc_revived", _target];