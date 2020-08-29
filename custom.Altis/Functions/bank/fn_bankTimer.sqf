#include "..\script_macros.hpp"
/*
    File: fn_demoChargeTimer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the "Demo" timer for the police.
*/
private["_uiDisp","_time","_timer"];
_vault = _this select 0;
_bad = false;

//Setup the progress bar
disableSerialization;
_title = "Raube Bank aus";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

player setVariable ["Bank_geschafft", true, true];

for "_i" from 0 to 1 step 0 do {
    sleep 4.8;
    if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	
    if (_cP >= 1) exitWith {};
	if((player distance _vault) > 12) exitWith {["Du hast dich mehr als 12m vom Tresor entfernt, der Raub ist fehlgeschlagen", true, "slow"] call life_fnc_showNotification;_bad = true;};
	if(life_isDead) exitWith {_bad = true;};
	if(player getVariable ["restrained", false]) exitWith {_bad = true;};
	if(life_istazed) exitWith {_bad = true;};
    if(!(isNull (objectParent player))) exitWith {_bad = true;};
};
5 cutText ["","PLAIN"];

if(_bad) exitWith {
_vault setVariable ["opening", false, true];
};
