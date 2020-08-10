disableSerialization;
private _vault = param [0, objNull];

if(isNull _vault) exitWith {};
if(_vault != zenti) exitWith {["Du kannst die Bombe nur an einem Tresor entschärfen.", "Zentralbank"] spawn life_fnc_message;};
if(!(_vault getVariable ["bombe", false])) exitWith {["Es befindet sich keine Bombe am Tresor.", "Zentralbank"] spawn life_fnc_message;};

life_action_inUse = true;
private _title = "Entschärfe Bombe";
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...", "%", _title];
_progressBar progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync", -2];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep 0.26;
    if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + .0035;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
    if (_cP >= 1 || life_isDead || life_isknocked || life_interrupted || !(_vault getVariable ["bombe", false])) exitWith {life_interrupted = false;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
life_action_inUse = false;
if (_cP < 1) exitWith {};

_vault setVariable ["bombe", false, true];
[format ["Die Sprengladung wurde von %1 entschärft.", profileName], "Zentralbank"] remoteExec ["life_fnc_message", west];
[] remoteExec ["life_fnc_copUnlock", playableUnits];