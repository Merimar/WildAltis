#include "..\script_macros.hpp"
disableSerialization;
private _target = param [0, objNull];

if(!(isNull(_target getVariable ["Reviving", objNull]))) exitWith {["Jemand anderes belebt den Spieler schon wieder.", "Defibrilator"] spawn life_fnc_message;};
if(life_istazed || life_isknocked || {player getVariable["restrained",false]} || life_action_inUse || player distance _target > 5) exitWith {};
if(!("defi" in LICENSES) && playerSide != west) exitWith {["", "Du brauchst eine Lizenz um den Defibrilator zu benutzen"] spawn life_fnc_message;};

private _speed = ["revive"] call life_fnc_getSkillAdvantage;
private _playerName = (_target getVariable ["Loot_Information", ["", ""]]) select 1;
_target setVariable ["Reviving", player, true];

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable ["life_progress",displayNull];
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

life_action_inUse = true;
for "_i" from 0 to 1 step 0 do {
	if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync", -2];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
	if (isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};

	sleep _speed;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["Belebe %3 wieder (%1%2)...", round(_cP * 100), "%", _playerName];
	if (_cP >= 1 || life_isDead || life_istazed || life_isknocked || life_interrupted || {player getVariable["restrained",false]} || player distance _target > 5 || _target getVariable ["Reviving", objNull] != player) exitWith {};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";
life_action_inUse = false;
life_interrupted = false;

if(_cP < 1) exitWith {};
_target setVariable ["Reviving", nil, true];
if(!([false, "defibrilator", 1] call life_fnc_handleInv)) exitWith {};

[player, "defibrilator"] remoteExec ["HC_fnc_useItem", HC_LIFE];
[player, true] remoteExec ["life_fnc_revived",_target];
["revive"] call life_fnc_addSkill;

[format["Du hast den Spieler %1 erfolgreich wiederbelebt.", _playerName], "Defibrilator"] spawn life_fnc_message;
sleep 1;
player reveal _target;