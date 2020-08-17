#include "..\script_macros.hpp"
disableSerialization;
private _hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F", "Land_Barracks_01_camo_F"],25]) select 0;
private _group = _hideout getVariable ["gangOwner", grpNull];

if(playerSide in [west, independent]) exitWith {};
if(((group player) getVariable ["gang_name", ""]) == "") exitWith {["Du musst in einer Gruppierung sein um ein Ganghideout einnehmen zu können.", "Nicht möglich"] spawn life_fnc_message;};
if(_group isEqualTo (group player)) exitWith {["Deine Gang besitzt dieses Ganghideout bereits", "Nicht möglich"] spawn life_fnc_message;};
if((_hideout getVariable ["inCapture", false])) exitWith {["Es nimmt bereits ein anderer Spieler das Ganghideout ein.", "Nicht möglich"] spawn life_fnc_message;};

life_action_inUse = true;

private _title = "Nehme Ganghideout ein";
5 cutRsc ["life_progress", "PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%", _title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync", -2];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep 0.6;
    if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
    _hideout setVariable ["inCapture", true, true];
    if (_cP >= 1 || life_isDead || life_istazed || life_isknocked || life_interrupted || {player getVariable ["restrained", false]} || player distance _hideout > 30) exitWith {};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
life_action_inUse = false;
life_interrupted = false;
_hideout setVariable ["inCapture", false, true];
if(_cp < 1) exitWith {};

private _markers = [["gang_area_1", "Gang Hideout 1 (Cannabisextraktor)"], ["gang_area_2", "Jürgens Waffenladen"], ["gang_area_3", "Gang Hideout 3 (Heroinaufbereitung)"], ["gang_area_4", "Gang Hideout 2 (Kokainextraktor)"]];
private _markerArray = (_markers select {(markerPos (_x select 0)) distance player <= 100}) select 0;
private _marker = _markerArray select 0;
private _defaultText = _markerArray select 1;
_marker setMarkerText format ["%1 - %2", _defaultText, (group player) getVariable ["gang_name", ""]];

titleText["Deine Gang hat das Hideout eingenommen", "PLAIN"];
[format["Die Gang %1 hat ein Ganghideout eingenommen", (group player) getVariable ["gang_name", ""]], "Gangversteck eingenommen"] remoteExec ["life_fnc_message", -2];
_hideout setVariable ["gangOwner",group player,true];