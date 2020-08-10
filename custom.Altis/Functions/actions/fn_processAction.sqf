#include "..\script_macros.hpp"
disableSerialization;
private _vendor = param [0, objNull];
private _type = param [1, ""];

if(isNull _vendor || _type isEqualTo "" || (player distance _vendor) > 10 || !isNull objectParent player || !isClass (missionConfigFile >> "CfgFarmRoutes" >> _type) || life_action_inUse || life_is_processing) exitWith {};

private _config = missionConfigFile >> "CfgFarmRoutes" >> _type;
private _processInput = getArray (_config >> "processInput");
private _processOutput = getArray (_config >> "processOutput");
private _processText = getText (_config >> "processText");
private _processSkill = getText (_config >> "processSkill"); 
private _hasLicense = if(isClass (missionConfigFile >> "Licenses" >> toLower _type)) then {(toLower _type) in LICENSES} else {true};
private _licenseCost = if(!_hasLicense) then {getNumber (missionConfigFile >> "Licenses" >> toLower _type >> "noLicenseCost")} else {0};
_processSkill = if(_processSkill == "") then {(2 * 60) / 100} else {[_processSkill] call life_fnc_getSkillAdvantage};
private _buff = if(["farm"] call life_fnc_isBuffOn) then {2} else {1};

private _processTime = _processSkill / _buff;
private _processAmount = 0;

if(CASH < _licenseCost) exitWith {[format ["Du kannst deine Rohstoffe hier nicht verarbeiten da dir €%1 fehlen. Wenn du eine Lizenz kaufst, ist das Verarbeiten kostenlos!", [_licenseCost - CASH] call life_fnc_numberText], "Verarbeitung"] spawn life_fnc_message;};

{
private _inputItem = _x select 0;
private _inputAmount = _x select 1;
private _unitAmount = ITEM_VALUE(_inputItem);
private _couldAmount = floor (_unitAmount / _inputAmount);

if(_couldAmount < _processAmount || _forEachIndex <= 0) then {_processAmount = _couldAmount;};
if(_processAmount <= 0) exitWith {};
}forEach _processInput;

if(_processAmount <= 0) exitWith {["Du hast nicht genügend Materialien.", "Verarbeitung"] spawn life_fnc_message;};

5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
private _cP = 0.01;

_pgText ctrlSetText format["%2 (1%1)...", "%", _processText];
_progress progressSetPosition 0.01;
life_is_processing = true;

for "_i" from 0 to 1 step 0 do {
	sleep _processTime;
	if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
    };
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...", round (_cP * 100), "%", _processText];
	if(_cP >= 1 || !(isNull objectParent player) || life_isDead || player distance _vendor > 10) exitWith {};
};

5 cutText ["","PLAIN"];
life_is_processing = false;

if(_cP < 1) exitWith {titleText ["Abgebrochen", "PLAIN"];};
if(CASH < _licenseCost) exitWith {[format ["Du kannst deine Rohstoffe hier nicht verarbeiten da dir €%1 fehlen. Wenn du eine Lizenz kaufst, ist das Verarbeiten kostenlos!", [_licenseCost - CASH] call life_fnc_numberText], "Verarbeitung"] spawn life_fnc_message;};

private _itemArrayInput = [];
private _itemArrayOutput = [];
private _success = true;

{
_success = [false, _x select 0, (_x select 1) * _processAmount] call life_fnc_handleInv;
private _displayName = getText (missionConfigFile >> "Items" >> _x select 0 >> "name");
_itemArrayInput pushBack (format ["%1 %2", (_x select 1) * _processAmount, _displayName]);
}forEach _processInput;

if(!_success) exitWith {["", "Du hast dieses Item nicht mehr"] spawn life_fnc_message;};

private _random = round (random (80)) + 1;
private _newRandom = round (random (100)) + 1;
private _relikt = format ["Relikt_%1", floor (_random / 20)];
if(_newRandom <= 20 && _type == "Relikt") exitWith {["", "Der Knochen ist zerbrochen"] spawn life_fnc_message;};

if(_type != "Relikt") then {
{
[true, _x select 0, (_x select 1) * _processAmount] call life_fnc_handleInv;
private _displayName = getText (missionConfigFile >> "Items" >> _x select 0 >> "name");
_itemArrayOutput pushBack (format ["%1 %2", (_x select 1) * _processAmount, _displayName]);
}forEach _processOutput;
}else {
[true, _relikt, 1] call life_fnc_handleInv;
private _displayName = getText (missionConfigFile >> "Items" >> _relikt >> "name");
_itemArrayOutput pushBack (format ["%1 %2", 1, _displayName]);
};

private _outputText = format ["Du hast %1 in %2 verarbeitet", _itemArrayInput joinString ", ", _itemArrayOutput joinString ", "];
titleText [_outputText, "PLAIN"];

CASH = CASH - _licenseCost;
[player, _type, _vendor, _relikt] remoteExec ["HC_fnc_processItem", HC_LIFE];

if(_type in ["Helium", "Dunkle", "Relikt"]) exitWith {};
[getText (_config >> "processSkill")] call life_fnc_addSkill;