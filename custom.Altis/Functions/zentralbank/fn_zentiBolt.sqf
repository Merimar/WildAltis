#include "..\script_macros.hpp"
disableSerialization;
private _building = param [0, objNull];
private _cops = {(side _x) isEqualTo west} count allPlayers;
private _speed = ["boltcutter"] call life_fnc_getSkillAdvantage;
private _currentPlayer = _building getVariable ["zenti_current", objNull];
private _doors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _building),"numberOfDoors");
private _door = 0;
private _title = "Knacke Zentralbank";
private _cP = 0.01;

if(life_action_inUse || !(isNull _currentPlayer)) exitWith {};
if(_cops < 15) exitWith {["Es sind nicht genügend Polizisten online, um die Zentralbank zu starten.<br/>Es müssen 15 Polizisten online sein", "Zentralbank"] spawn life_fnc_message;};
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};

private _worldSpace = [0, 0, 0];

for "_i" from 1 to _doors do {
private _selPos = _building selectionPosition format["Door_%1_trigger", _i];
_worldSpace = _building modelToWorld _selPos;
if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(_door isEqualTo 0) exitWith {["Du bist nicht in der Nähe einer Tür.", "Zentralbank"] spawn life_fnc_message;};
if((_building getVariable [format ["bis_disabled_Door_%1", _door], 0]) isEqualTo 0) exitWith {["Diese Tür ist bereits offen.", "Zentralbank"] spawn life_fnc_message;};

_building setVariable ["zenti_current", player, true];
life_action_inUse = true;

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progressBar = _ui displayCtrl 38201;
private _titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%", _title];
_progressBar progressSetPosition 0.01;

for "_i" from 0 to 1 step 0 do {
sleep _speed;
if (isNull _ui) then {
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable "life_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
};
_cP = _cP + 0.01;
_progressBar progressSetPosition _cP;
_titleText ctrlSetText format["%3 (%1%2)...", round(_cP * 100), "%", _title];
if(_cP >= 1 || life_isDead || life_istazed || life_isknocked || {player getVariable ["restrained", false]} || player distance _worldSpace > 5) exitWith {};
};

5 cutText ["","PLAIN"];
life_action_inUse = false;
_building setVariable ["zenti_current", objNull, true];

if(_cP < 1) exitWith {};

["boltcutter"] call life_fnc_addSkill;
["Du hast die Zentralbank geknackt, die Polizei wurde informiert", "Zentralbank"] spawn life_fnc_message;
life_boltcutter_uses = life_boltcutter_uses + 1;

if (life_boltcutter_uses >= 5) then {
[false, "boltcutter", 1] call life_fnc_handleInv;
[player, "boltcutter"] remoteExec ["HC_fnc_useItem", HC_LIFE];
life_boltcutter_uses = 0;
};

_building setVariable [format ["bis_disabled_Door_%1", _door], 0, true];
[player] remoteExec ["HC_fnc_boltZenti", HC_LIFE];