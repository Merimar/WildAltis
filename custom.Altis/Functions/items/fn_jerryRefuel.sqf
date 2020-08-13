#include "..\script_macros.hpp"
private _vehicle = cursorObject;
private _speed = ["repair"] call life_fnc_getSkillAdvantage;
private _title = "Fülle Fahrzeug auf";
life_interrupted = false;

if(isNull _vehicle || !(_vehicle isKindOf "LandVehicle" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship") || player distance _vehicle > 7.5 || (["fuelFull"] call life_fnc_getItemValue) <= 0 || {player getVariable ["restrained", false]} || {player getVariable ["playerSurrender", false]}) exitWith {};
if(!([false, "fuelFull", 1] call life_fnc_handleInv)) exitWith {};

[true, "fuelEmpty", 1] call life_fnc_handleInv;
[player, "fuelFull"] remoteExec ["HC_fnc_useItem", HC_LIFE];
life_action_inUse = true;
closeDialog 0;

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
private _cP = 0.01;
_pgText ctrlSetText format["%2 (1%1)...", "%", _title];
_progress progressSetPosition 0.01;

for "_i" from 0 to 1 step 0 do {
if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
	[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync", -2];
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
};
sleep _speed;
	if (isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
	};
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
if (_cP >= 1 || life_isDead || life_interrupted || {player getVariable ["restrained", false]} || {player getVariable ["playerSurrender", false]} || isNull _vehicle || player distance _vehicle > 7.5) exitWith {life_interrupted = false;};
};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(_cP < 1) exitWith {};

titleText ["Du hast dein Fahrzeug erfolgreich aufgefüllt", "PLAIN"];

private _fuel = switch (true) do {case (_vehicle isKindOf "LandVehicle") : {0.5};case (_vehicle isKindOf "Air") : {0.2};case (_vehicle isKindOf "Ship") : {0.35};};
if(local _vehicle) then {_vehicle setFuel ((fuel _vehicle) + 0.5);}else {[_vehicle, (fuel _vehicle) + 0.5] remoteExecCall ["life_fnc_setFuel", _vehicle];};