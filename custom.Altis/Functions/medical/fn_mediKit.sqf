if(player getVariable ["restrained", false] || life_isDead || life_istazed || life_isknocked || life_action_inUse || (speed player) != 0 || !(isNull objectParent player)) exitWith {};

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
private _text = "Benutze MediKit";
private _cP = 0.01;
_titleText ctrlSetText format["%2 (1%1)...", "%", _text];
_progressBar progressSetPosition 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player, "AinvPknlMstpSnonWnonDnon_medic_1", true] remoteExecCall ["life_fnc_animSync", -2];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
	if (isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
    sleep 0.3;
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _text];
    if (_cP >= 1 || life_isDead || life_istazed || life_isknocked || life_interrupted || {player getVariable["restrained",false]}) exitWith {life_interrupted = false;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
life_action_inUse = false;

if(_cP < 1) exitWith {};
if(!([false, "medikit", 1] call life_fnc_handleInv)) exitWith {["Das Medikit mit dem du dich geheilt hast ist verschwunden!", "Medikit"] spawn life_fnc_message;};

["Du hast dich vollständig geheilt.", "Medikit"] spawn life_fnc_message;
[player] remoteExec ["HC_fnc_mediKit", HC_LIFE];