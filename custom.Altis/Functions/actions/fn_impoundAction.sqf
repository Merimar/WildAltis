#include "..\script_macros.hpp"
private _vehicle = param [0, objNull];
if(player distance _vehicle > 10) exitWith {};
if(_vehicle getVariable "NPC") exitWith {["Du kannst dieses Fahrzeug nicht beschlagnahmen", true, "slow"] call life_fnc_showNotification;};
if(_vehicle getVariable ["event_vehicle", false]) exitWith {[["Du kannst keine Event Fahrzeuge beschlagnahmen"] call life_fnc_getCleanString, true, "fast"] call life_fnc_showNotification;};

private _speed = ["impound"] call life_fnc_getSkillAdvantage;
private _vehicleData = _vehicle getVariable ["vehicle_info_owners", []];
private _vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
private _dbInfo = _vehicle getVariable ["dbInfo", []];
private _extraInfo = if(playerSide isEqualTo independent) then {"abgeschleppt"} else {"beschlagnahmt"};
private _notification = if(playerSide isEqualTo west) then {"Polizei"} else {"Feuerwehr"};

private _rent = _vehicle getVariable ["rent", false];
private _extraInfo = if(playerSide isEqualTo independent) then {"abgeschleppt"} else {"beschlagnahmt"};

if((count _vehicleData isEqualTo 0 || count _dbInfo isEqualTo 0) && !_rent) exitWith {};
private _vehSide = _dbInfo select 1;

private _notification = if(playerSide isEqualTo west) then {"Polizei"}  else {"Feuerwehr"};

if(alive _vehicle) then {
    private _message = format ["%1 dein Fahrzeug wird von der %2 %3", _vehicleData select 0 select 1, _notification, _extraInfo];
    [0, _message] remoteExecCall ["life_fnc_broadcast", -2];
};

life_action_inUse = true;

private _header = "Beschlagnahmen";
private _exit = true;
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_header];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    sleep _speed;
    _cP = _cP + 0.01;
	if (isNull _ui) then {
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
    };
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_header];
    if(_cP >= 1) exitWith {_exit = false;};
    if(player distance _vehicle > 10) exitWith {};
    if(player getVariable ["isDead", false]) exitWith {};
    if(!(isNull objectParent player)) exitWith {};
};

5 cutText ["","PLAIN"];
life_action_inUse = false;

if(_exit) exitWith {["", "Du hast dich zu weit entfernt"] spawn life_fnc_message;};
if((count crew _vehicle) > 0) exitWith {["Es befinden sich noch Spieler im Fahrzeug", "Beschlagnahmen"] spawn life_fnc_message;};

private _action = if(playerSide isEqualTo west && _vehSide in [civilian, east]) then {["Möchtest du das Fahrzeug auf den Abstellhof oder in die Garage stellen?", "Fahrzeug abschleppen", "Abstellhof", "Garage"] call BIS_fnc_guiMessage} else {false};

[_vehicle, player, _action] remoteExec ["HC_fnc_abschleppVehicle",HC_LIFE];

["impound"] call life_fnc_addSkill;

if(alive _vehicle) then {
    private _message = format ["%1 dein Fahrzeug wurde von der %2 %3", _vehicleData select 0 select 1, _notification, _extraInfo];
    [0, _message] remoteExecCall ["life_fnc_broadcast", -2];
};