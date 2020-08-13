#include "..\script_macros.hpp"
disableSerialization;
life_interrupted = false;
private _fuelStations = nearestObjects [player, ["Land_FuelStation_Feed_F","Land_fs_feed_F"], 4];
if((["fuelEmpty"] call life_fnc_getItemValue) <= 0 || life_action_inUse || !isNull objectParent player || {player getVariable ["restrained", false]} || {player getVariable ["playerSurrender", false]} || count _fuelStations isEqualTo 0) exitWith {};
if(CASH < 10000) exitWith {["", "Du hast keine €10.000"] spawn life_fnc_message;};

private _action = ["Benzinkanister auffüllen","Möchtest du den Benzinkanister auffüllen. Es kostet dich €10.000","Ja", "Nein"] call BIS_fnc_guiMessage;
if(!_action) exitWith {};
life_action_inUse = true;
closeDialog 0;

5 cutRsc ["life_progress","PLAIN"];
private _title = "Fülle Benzinkanister auf";
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...", "%", _title];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
sleep 0.2;
	if (isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
	};
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
if(_cP >= 1 || life_isDead || life_interrupted || !isNull objectParent player || {player getVariable ["restrained", false]} || {player getVariable ["playerSurrender", false]}) exitWith {life_interrupted = false;};
};

_fuelStations = nearestObjects [player, ["Land_FuelStation_Feed_F","Land_fs_feed_F"], 4];

5 cutText ["","PLAIN"];
player playActionNow "stop";
life_action_inUse = false;

if(_cP < 1 || count _fuelStations isEqualTo 0) exitWith {};
if(!([false, "fuelEmpty", 1] call life_fnc_handleInv)) exitWith {};

[true, "fuelFull", 1] call life_fnc_handleInv;
["Du hast deinen Benzinkanister wieder aufgefüllt.", "Benzinkanister"] spawn life_fnc_message;
[player, "fuelEmpty"] remoteExec ["HC_fnc_useItem", HC_LIFE];
CASH = CASH - 10000;