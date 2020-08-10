#include "..\script_macros.hpp"
disableSerialization;
private _curTarget = cursorObject;
life_interrupted = false;

private _speed = ["repair"] call life_fnc_getSkillAdvantage;
private _luck = ["lockpick"] call life_fnc_getSkillAdvantage;

if(life_action_inUse || isNull _curTarget || {player getVariable ["restrained", false]} || {player getVariable ["playerSurrender", false]} || {!alive _curTarget}) exitWith {};
if(LOCKPICK_TIMER) exitWith {["Du kannst nur alle 20 Sekunden ein Fahrzeug knacken.", "Dietrich"] spawn life_fnc_message;};
private _distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {};

private _lockType = if(typeOf _curTarget == "Land_BackAlley_01_l_gate_F") then {"zelle"} else {"player"};
private _text = if(_lockType == "player") then {"Befreie Spieler"} else {"Knacke Zellentür"};
private _isVehicle = (_curTarget isKindOf "LandVehicle" || _curTarget isKindOf "Ship" || _curTarget isKindOf "Air");
if(_isVehicle && _lockType == "player") then {_text = "Knacke Fahrzeug";};

if(_lockType == "player" && !_isVehicle && (!(isPlayer _curTarget) || !(_curTarget getVariable ["restrained", false]))) exitWith {};
if(_lockType == "player" && _isVehicle && (_curTarget in life_vehicles || {_curTarget getVariable ["event_vehicle", false]})) exitWith {};
if(_lockType == "zelle" && (_curTarget getVariable ["bis_disabled_Door_1", 0]) isEqualTo 0) exitWith {};

life_action_inUse = true;
[] spawn {LOCKPICK_TIMER = true;sleep 20;LOCKPICK_TIMER = false;};

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
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
    sleep _speed;
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _text];
    if (_cP >= 1 || life_isDead || life_istazed || life_isknocked || life_interrupted || {player getVariable["restrained",false]} || player distance _curTarget > _distance) exitWith {life_interrupted = false;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
life_action_inUse = false;

if(_cP < 1) exitWith {};
private _exit = false;
if(!(playerSide isEqualTo independent)) then {
if(!([false, "lockpick", 1] call life_fnc_handleInv)) then {_exit = true;};
};

if(_exit) exitWith {};

["lockpick"] call life_fnc_addSkill;

_dice = round(random(100)) + 1;
if(_dice >= _luck && (_lockType == "player" && _isVehicle)) exitWith {
titleText ["Der Dietrich ist abgebrochen", "PLAIN"];
[0, format ["Der Spieler %1 wurde beim knacken eines Fahrzeuges beobachtet", profileName]] remoteExecCall ["life_fnc_broadcast",west];
[player, "lockpick", [_curTarget, false]] remoteExec ["HC_fnc_useItem", HC_LIFE];
};

if(_lockType == "player") then {
	if(_isVehicle) then {
		life_vehicles pushBack _curTarget;
		titleText ["Du hast nun die Schlüssel für das Fahrzeug", "PLAIN"];
		if(playerSide != independent) then {
			[_curTarget, "alarm"] remoteExec ["life_fnc_say3D", RCLIENT];
		};
	}else {
		_curTarget setVariable ["restrained", false, true];
		_curTarget setVariable ["Escorting", false, true];
		_curTarget setVariable ["transporting", false, true];
		detach _curTarget;
	};
}else {
	titleText ["Du hast die Zellentür aufgebrochen", "PLAIN"];
	_curTarget setVariable ["bis_disabled_Door_1", 0, true];
};

[player, "lockpick", [_curTarget, true]] remoteExec ["HC_fnc_useItem", HC_LIFE];